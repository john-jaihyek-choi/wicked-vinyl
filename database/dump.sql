--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
ALTER TABLE ONLY public.carts DROP CONSTRAINT carts_pkey;
ALTER TABLE ONLY public."cartItems" DROP CONSTRAINT "cartItems_pkey";
ALTER TABLE public.products ALTER COLUMN "productId" DROP DEFAULT;
ALTER TABLE public.orders ALTER COLUMN "orderId" DROP DEFAULT;
ALTER TABLE public.carts ALTER COLUMN "cartId" DROP DEFAULT;
ALTER TABLE public."cartItems" ALTER COLUMN "cartItemId" DROP DEFAULT;
DROP SEQUENCE public."products_productId_seq";
DROP TABLE public.products;
DROP SEQUENCE public."orders_orderId_seq";
DROP TABLE public.orders;
DROP SEQUENCE public."carts_cartId_seq";
DROP TABLE public.carts;
DROP SEQUENCE public."cartItems_cartItemId_seq";
DROP TABLE public."cartItems";
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: cartItems; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."cartItems" (
    "cartItemId" integer NOT NULL,
    "cartId" integer NOT NULL,
    "productId" integer NOT NULL,
    price integer NOT NULL,
    quantity integer
);


--
-- Name: cartItems_cartItemId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."cartItems_cartItemId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cartItems_cartItemId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."cartItems_cartItemId_seq" OWNED BY public."cartItems"."cartItemId";


--
-- Name: carts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.carts (
    "cartId" integer NOT NULL,
    "createdAt" timestamp(6) with time zone DEFAULT now() NOT NULL
);


--
-- Name: carts_cartId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."carts_cartId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: carts_cartId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."carts_cartId_seq" OWNED BY public.carts."cartId";


--
-- Name: orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.orders (
    "orderId" integer NOT NULL,
    "cartId" integer NOT NULL,
    "fName" text NOT NULL,
    "lName" text NOT NULL,
    address1 text NOT NULL,
    address2 text NOT NULL,
    city text NOT NULL,
    state text NOT NULL,
    zip text NOT NULL,
    "creditCardNumber" text NOT NULL,
    month text NOT NULL,
    year text NOT NULL,
    cvv text NOT NULL,
    "createdAt" timestamp(6) with time zone DEFAULT now() NOT NULL
);


--
-- Name: orders_orderId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."orders_orderId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: orders_orderId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."orders_orderId_seq" OWNED BY public.orders."orderId";


--
-- Name: products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products (
    "productId" integer NOT NULL,
    album text,
    artist text,
    "releaseYear" integer,
    price integer NOT NULL,
    "albumArt" text,
    genre text,
    description text NOT NULL,
    category text NOT NULL,
    name text,
    brand text,
    color text
);


--
-- Name: products_productId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."products_productId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: products_productId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."products_productId_seq" OWNED BY public.products."productId";


--
-- Name: cartItems cartItemId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."cartItems" ALTER COLUMN "cartItemId" SET DEFAULT nextval('public."cartItems_cartItemId_seq"'::regclass);


--
-- Name: carts cartId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.carts ALTER COLUMN "cartId" SET DEFAULT nextval('public."carts_cartId_seq"'::regclass);


--
-- Name: orders orderId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders ALTER COLUMN "orderId" SET DEFAULT nextval('public."orders_orderId_seq"'::regclass);


--
-- Name: products productId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products ALTER COLUMN "productId" SET DEFAULT nextval('public."products_productId_seq"'::regclass);


--
-- Data for Name: cartItems; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."cartItems" ("cartItemId", "cartId", "productId", price, quantity) FROM stdin;
\.


--
-- Data for Name: carts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.carts ("cartId", "createdAt") FROM stdin;
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.orders ("orderId", "cartId", "fName", "lName", address1, address2, city, state, zip, "creditCardNumber", month, year, cvv, "createdAt") FROM stdin;
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products ("productId", album, artist, "releaseYear", price, "albumArt", genre, description, category, name, brand, color) FROM stdin;
1	Help!	The Beatles	1965	1999	/images/albumArt/Help!.jpg	Rock	Help! is the fifth studio album by the English rock band the Beatles and the soundtrack from their film of the same name, It was released on 6 August 1965. Produced by George Martin, it was the fifth UK album release by the band, and contains fourteen songs in its original British form. Seven of these, including the singles "Help!" and "Ticket to Ride", appeared in the film and took up the first side of the vinyl album. The second side contained seven other releases including the most-covered song ever written, "Yesterday".	vinyl	\N	\N	\N
2	Discovery	Daft Punk	2001	1799	/images/albumArt/Discovery.jpg	Electronic	Discovery is the second studio album by French electronic music duo Daft Punk, released on 26 February 2001 by Virgin Records. It marks a shift from the Chicago house sound prevalent on their first studio record, Homework (1997), to a house style more heavily inspired by disco, post-disco, garage house, and R&B. Comparing their stylistic approach to their previous album, band member Thomas Bangalter described Discovery as an exploration of song structures and musical forms whereas Homework was "raw" electronic music. He also described Discovery as a reflection of the duo's childhood memories, when they listened to music with a more playful and innocent viewpoint.	vinyl	\N	\N	\N
3	My Beautiful Dark Twisted Fantasy	Kanye West	2010	2999	/images/albumArt/MBDTF.jpg	Hip-Hop	My Beautiful Dark Twisted Fantasy is the fifth studio album by American rapper and producer Kanye West. It was released on November 22, 2010, through Def Jam Recordings and Roc-A-Fella Records. Following a period of public and legal controversy, West retreated to a self-imposed exile in Hawaii in 2009. There, he worked on the album in a communal recording environment involving numerous contributing musicians and producers. The recording sessions featured guest appearances from: Bon Iver, Jay-Z, Pusha T, Rick Ross, Kid Cudi, Nicki Minaj, John Legend, and Raekwon, among others.	vinyl	\N	\N	\N
4	Kind of Blue	Miles Davis	1959	2299	/images/albumArt/Kind-of-Blue.jpg	Jazz	Kind of Blue is a studio album by American jazz trumpeter Miles Davis. It was recorded on March 2 and April 22, 1959, at Columbia's 30th Street Studio in New York City, and released on August 17 of that year by Columbia Records. The album features Davis's ensemble sextet consisting of saxophonists John Coltrane and Julian "Cannonball" Adderley, pianist Bill Evans, bassist Paul Chambers, and drummer Jimmy Cobb, with new band pianist Wynton Kelly appearing on one track in place of Evans. In part owing to Evans' joining the sextet during 1958, Davis followed up on the modal experimentation of Milestones by basing Kind of Blue entirely on modality, departing further from his earlier work's hard bop style of jazz.	vinyl	\N	\N	\N
5	Red Headed Stranger	Willie Nelson	1975	1999	/images/albumArt/Red-Headed-Stranger.jpg	Folk	A concept album, Red Headed Stranger is about a fugitive on the run from the law after killing his wife and her lover. The content consists of songs with brief poetic lyrics and arrangements of older material such as Fred Rose's "Blue Eyes Crying in the Rain", Wolfe Gilbert's "Down Yonder" and Juventino Rosas' "O'er the Waves". Despite Columbia's doubts and the limited instrumentation, Red Headed Stranger was a blockbuster among country music and mainstream audiences. It was certified multi-platinum, and made Nelson one of the most recognized artists in country music. The cover of "Blue Eyes Crying in the Rain", released as a single previous to the album full release became Nelson's first number one hit.	vinyl	\N	\N	\N
6	For Emma, Forever Ago	Bon Iver	2008	1999	/images/albumArt/For-Emma.jpg	Alternative	For Emma, Forever Ago is the debut studio album by American indie folk band Bon Iver. It was first self-released in July 2007, and later saw wide release on the Jagjaguwar label in February 2008. The album is principally the work of singer-songwriter Justin Vernon. Whilst living in Raleigh, North Carolina, Vernon fell ill with mononucleosis and a liver infection, and grew frustrated with his songwriting and life. He left Raleigh and drove to his father's remote hunting cabin an hour northwest of his hometown, Eau Claire, Wisconsin, hoping to be alone.	vinyl	\N	\N	\N
7	Narrow Stairs	Death Cab for Cutie	2008	1799	/images/albumArt/Narrow-Stairs.jpg	Alternative	Narrow Stairs is the sixth studio album by indie rock band Death Cab for Cutie, released on May 12, 2008 in the United Kingdom and on May 13, 2008, in the United States, on Atlantic and Barsuk Records.	vinyl	\N	\N	\N
8	Surf	Donnie Trumpet and the Social Experiment	2015	2299	/images/albumArt/Surf.png	Hip-Hop	Surf is the debut studio album by American band The Social Experiment; it was released exclusively on iTunes as a free download on May 28, 2015. The album highlights trumpeter Nico Segal, formerly known as "Donnie Trumpet," and was created by Segal along with his band of collaborators called The Social Experiment — a self-described group of bohemian musicians, consisting of Segal, Chance the Rapper, Peter Cottontale, Greg Landfair Jr., and Nate Fox. The album was highly anticipated because of Chance's heavy involvement with the group, contributing vocals and some of the arrangements to the album. Surf was downloaded 618,000 times via iTunes in its first week, with over 10 million individual track downloads.	vinyl	\N	\N	\N
9	New Energy	Four Tet	2017	1999	/images/albumArt/New-Energy.jpg	Electronic	New Energy is the ninth studio album by British electronic musician Kieran Hebden, released under his alias Four Tet on 29 September 2017 by Text Records. The album follows a more uptempo, listener-friendly style than previous Four Tet records while containing elements of those albums and a variety of musical styles as well as virtual instrument replications of culturally-tinged instruments. The album garnered critical acclaim, landing on several year-end lists by publications such as PopMatters, Q, Uncut, The Guardian, and Pitchfork, and reached number 48 on the UK Albums Chart.	vinyl	\N	\N	\N
10	ZABA	Glass Animals	2014	2999	/images/albumArt/ZABA.jpg	Alternative	Zaba (stylised as ZABA) is the debut studio album by English alternative group Glass Animals, released on 9 June 2014 by Wolf Tone/Caroline International and on 17 June 2014 by Harvest Records in the US.	vinyl	\N	\N	\N
11	Demon Days	Gorillaz	2005	9999	/images/albumArt/Demon-Days.jpg	Alternative	Demon Days is the second studio album by English virtual band Gorillaz. It was first released on 11 May 2005 in Japan and on 23 May 2005 in the United Kingdom by Parlophone and in the United States by Virgin Records. Produced by the band, Danger Mouse, Jason Cox, and James Dring, the album features contributions from De La Soul, Neneh Cherry, Martina Topley-Bird, Roots Manuva, MF DOOM, Ike Turner, Bootie Brown of the Pharcyde, Shaun Ryder, and Dennis Hopper. As with the band's eponymous 2001 debut, the release of Demon Days and its respective live performances were both accompanied by various multimedia, including interactive features on the Gorillaz website, a total of four animated music videos, and animatics for select videos. Almost all visuals associated with the album were designed by Gorillaz co-creator Jamie Hewlett, under his design company Zombie Flesh Eaters.	vinyl	\N	\N	\N
12	Art Angels	Grimes	2015	2499	/images/albumArt/Art-Angels.jpg	Electronic	Art Angels has been described as being more accessible than Boucher's previous albums while retaining her experimental influences. The album features guest appearances by Taiwanese rapper Aristophanes and American singer Janelle Monáe. The album spawned two singles—"Flesh Without Blood" and "Kill V. Maim"—as well as music videos for several tracks. Art Angels sold 11,000 copies in its first week in the United States and became Boucher's highest-charting album so far. The album was released to widespread critical acclaim and was ranked by several publications as one of the best albums of 2015.	vinyl	\N	\N	\N
13	In Colour	Jamie xx	2015	2199	/images/albumArt/In-Colour.jpg	Electronic	In Colour is the debut studio album by English producer Jamie xx, released on 29 May 2015 by Young Turks. The album was composed during a five-year period while a member of the indie pop band The xx, starting with his production on xx in 2009. After starting his solo career with the remix album We're New Here (2011) and singles like "All Under One Roof Raving" (2014), he was intent on making the album something of a departure from his previous work and genre. The album features guest vocals from fellow The xx members Romy and Oliver Sim, as well as from Young Thug and Popcaan. The album produced five singles: "Girl" and "Sleep Sound" as a double-single on 5 May 2014, "Loud Places" on 27 March 2015, "Gosh" on 4 May and "I Know There's Gonna Be (Good Times)" on 22 May.	vinyl	\N	\N	\N
14	99.9%	KAYTRANADA	2016	1999	/images/albumArt/Kaytra.jpg	Electronic	99.9% is the debut studio album by Canadian electronic music producer Kaytranada, released on May 6, 2016, through XL Recordings worldwide and Ultra Records in Canada. The 15-track album features guest contributions from the likes of Anderson .Paak, Vic Mensa, Little Dragon, Syd, Craig David, AlunaGeorge, and BadBadNotGood amongst others. 99.9% was supported by five singles: "Leave Me Alone" featuring Shay Lia, "Drive Me Crazy" featuring Vic Mensa, the Karriem Riggins and River Tiber-assisted instrumental "Bus Ride", "Glowed Up" featuring Anderson .Paak, and "Lite Spots".	vinyl	\N	\N	\N
15	good kid, m.A.A.d city	Kendrick Lamar	2012	2499	/images/albumArt/good-kid.jpg	Hip-Hop	Good Kid, M.A.A.D City (stylized as good kid, m.A.A.d city) is the second studio album by American rapper Kendrick Lamar. It was released on October 22, 2012, through Top Dawg Entertainment, distributed by Aftermath Entertainment and Interscope Records. The album is Lamar's major label debut, after his independently released first album Section.80 in 2011 and his signing to Aftermath and Interscope the following year.	vinyl	\N	\N	\N
16	Man on the Moon: The End of Day	Kid Cudi	2009	2199	/images/albumArt/Man-on-the-Moon.jpg	Hip-Hop	Man on the Moon: The End of Day is the debut studio album by American rapper Kid Cudi. It was released on September 15, 2009, by Dream On, GOOD Music and Universal Motown Records. A concept album, narrated by fellow American rapper Common, it follows the release of his first mixtape A Kid Named Cudi (2008). Production was handled by several record producers, including Cudi, Kanye West, Emile Haynie, Plain Pat, No I.D., Dot da Genius and Jeff Bhasker, among others.	vinyl	\N	\N	\N
17	Hot Fuss	The Killers	2004	2599	/images/albumArt/Hot-Fuss.jpg	Alternative	Hot Fuss is the debut studio album by the American rock band The Killers. It was released on June 7, 2004, in the United Kingdom and on June 15, 2004, in the United States. The album is mostly influenced by new wave music and post-punk. Hot Fuss spawned four commercially and critically successful singles: "Mr. Brightside", "Somebody Told Me", "All These Things That I've Done" and "Smile Like You Mean It".	vinyl	\N	\N	\N
18	Led Zeppelin II 	Led Zeppelin	1969	2799	/images/albumArt/Led-Zeppelin-II.jpg	Rock	Led Zeppelin II is the second album by the English rock band Led Zeppelin, released on 22 October 1969 in the United States and on 31 October 1969 in the United Kingdom by Atlantic Records. Recording sessions for the album took place at several locations in both the United Kingdom and North America from January to August 1969. The album's production was credited to the band's lead guitarist and songwriter Jimmy Page, and it was also Led Zeppelin's first album on which Eddie Kramer served as engineer. The album exhibited the band's evolving musical style of blues-derived material and their guitar riff-based sound. It has been described as the band's heaviest album. Six of the nine songs were written by the band, while the other three were reinterpretations of Chicago blues songs by Willie Dixon and Howlin' Wolf. One single, "Whole Lotta Love", was released outside of the UK (the band would release no UK singles during their career), and peaked as a top-ten single in over a dozen markets around the world.	vinyl	\N	\N	\N
19	Good Thing	Leon Bridges	2018	2199	/images/albumArt/Good-Thing.jpg	R&B	Good Thing is the second studio album by American singer Leon Bridges. It was released on May 4, 2018, by Columbia Records. The album was supported by three singles: "Bet Ain't Worth the Hand", "Bad Bad News" and "Beyond". Good Thing received generally positive reviews from critics and debuted at number three on the US Billboard 200. The album was nominated for Best R&B Album at the 2019 Grammy Awards. Its single "Bet Ain't Worth the Hand" won a Grammy for Best Traditional R&B Performance.	vinyl	\N	\N	\N
20	Madvillainy 	Madvillain	2004	2499	/images/albumArt/Madvillainy.jpg	Hip-Hop	Madvillainy is the debut studio album by American hip hop duo Madvillain, a group consisting of MF Doom (MC) and Madlib (producer). It was released on March 23, 2004 on Stones Throw Records. The album was recorded between 2002 and 2004 and was produced entirely by Madlib, with the exception of "The Illest Villains" which was produced by both Madlib and Doom. Madlib created most of the album's instrumentals during a trip to Brazil, where the production was composed in his hotel room using minimal amounts of equipment: a Boss SP-303, a turntable, and a tape deck. Fourteen months before the album was officially released, an unfinished demo of the album was stolen and leaked onto the internet. Frustrated over the leak, the duo stopped working on the album and returned to it only after they released other solo projects.	vinyl	\N	\N	\N
21	What's Going On	Marvin Gaye	1971	1999	/images/albumArt/Whats-Going-On.jpg	R&B	What's Going On is the eleventh studio album by American soul singer, songwriter, and producer Marvin Gaye. It was released on May 21, 1971, by the Motown Records-subsidiary label Tamla. What's Going On is a concept album with most of its songs segueing into the next and has been categorized as a song cycle; the album ends with a reprise of the album's opening theme. The narrative established by the songs is told from the point of view of a Vietnam veteran returning to his home country to witness hatred, suffering, and injustice. Gaye's introspective lyrics explore themes of drug abuse, poverty, and the Vietnam War. He has also been credited with promoting awareness of ecological issues before the public outcry over them had become prominent.	vinyl	\N	\N	\N
22	Modal Soul	Nujabes	2005	3199	/images/albumArt/Modal-Soul.jpg	Electronic	Modal Soul is the second full-length album by Japanese hip-hop artist Nujabes, released on November 11, 2005, on Nujabes' own record label Hydeout Productions. Like its predecessor, Metaphorical Music, Modal Soul fuses jazzy, smooth rhythms and hip hop. The album features artists Cise Starr (of CYNE), Akin, Terry Callier, Shing02, Substantial, Pase Rock, Apani B and Uyama Hiroto.	vinyl	\N	\N	\N
23	A Fever You Can't Sweat Out	Panic! at the Disco	2005	1899	/images/albumArt/A-Fever.jpg	Alternative	A Fever You Can't Sweat Out is the debut studio album by American pop rock band Panic! at the Disco. Produced by Matt Squire, the album was released on September 27, 2005, on Decaydance and Fueled by Ramen. The group formed in Las Vegas in 2004 and began posting demos online, which caught the attention of Fall Out Boy bassist Pete Wentz. Wentz signed the group to his own imprint label, Decaydance, without them having ever performed live. It is the only album released during original bassist Brent Wilson's time in the band, but the exact nature of his involvement in the writing and recording process became a source of contention upon his dismissal from the group in mid-2006.	vinyl	\N	\N	\N
24	Worlds	Porter Robinson	2014	2199	/images/albumArt/Worlds.jpg	Electronic	Worlds is the debut studio album by the American electronic music producer Porter Robinson, released on August 12, 2014 by Astralwerks in the United States and by Virgin EMI Records internationally. The album exhibits a shift in Robinson's music style from the heavy, bass-fueled complextro of his previous work to a more alternative form of electronic music.[2]	vinyl	\N	\N	\N
25	Classics	Ratatat	2005	1999	/images/albumArt/Classics.jpg	Alternative	Classics is the second full-length album from Ratatat, released on August 22, 2006. As with their first album, Classics is almost entirely instrumental, with the only exception being a large cat-like sound sample used in "Wildcat." This album produced three singles: "Lex", "Wildcat", and "Loud Pipes".	vinyl	\N	\N	\N
26	Let It Bleed	The Rolling Stones	1969	2799	/images/albumArt/Let-It-Bleed.jpg	Rock	Let It Bleed is the eighth British and tenth American studio album by English rock band the Rolling Stones, released in December 1969 by Decca Records in the United Kingdom and London Records in the United States. Released shortly after the band's 1969 American Tour, it is the follow-up to 1968's Beggars Banquet.	vinyl	\N	\N	\N
27	Scenery	Ryo Fukui	1976	3499	/images/albumArt/Scenery.jpg	Jazz	Scenery is a 1976 jazz album by Japanese pianist Ryo Fukui. It was Fukui's first release. The album was virtually ignored in the US, as it came out at a time of reduced interest in jazz in America. However, it was well appreciated by Japanese fans and critics alike. In the decades since Scenery's release, the album has earned greater critical praise. Fukui's dexterity and self-taught style has earned him comparison to such piano greats as McCoy Tyner and Bill Evans.	vinyl	\N	\N	\N
28	Aja	Steely Dan	1977	1999	/images/albumArt/aja.jpg	Rock	Aja (/ˈeɪʒə/, pronounced Asia) is the sixth studio album by the jazz rock band Steely Dan. Originally released in 1977 on ABC Records, the album peaked at number three on the US charts and number five in the UK. It was the band's first platinum album and ultimately became their best-selling studio release, eventually selling over 5 million copies. It spawned a number of hit singles, including "Peg", "Deacon Blues", and "Josie". In July 1978, the album won the Grammy Award for Best Engineered Non-Classical Recording and received Grammy nominations for Album of the Year and Best Pop Performance by a Duo or Group with Vocals. The credits for Aja list nearly 40 musicians, as band leaders Donald Fagen and Walter Becker pushed Steely Dan further into experimenting with different combinations of session players.	vinyl	\N	\N	\N
29	Is This It	The Strokes	2001	2199	/images/albumArt/Is-This-It.jpg	Alternative	Is This It is the debut studio album by American rock band the Strokes, released on July 30, 2001, by RCA Records. It was recorded at Transporterraum in New York City with producer Gordon Raphael during March and April 2001. For their debut, the band strived to capture a simple sound that was not significantly enhanced in the studio. Building on their 2001 EP The Modern Age, the band members molded compositions largely through live takes during recording sessions, while songwriter and lead singer Julian Casablancas continued to detail the lives and relationships of urban youth.	vinyl	\N	\N	\N
30	Lonerism	Tame Impala	2012	2299	/images/albumArt/Lonerism.jpg	Alternative	Lonerism is the second studio album by the Australian rock band Tame Impala, released on 5 October 2012 by Modular Recordings. Like the band's debut studio album, Innerspeaker (2010), Lonerism was written, recorded, performed, and produced by Kevin Parker, with live member Jay Watson contributing on two tracks. Recorded mostly in Perth, Australia, and Paris, France, Lonerism builds on the psychedelic sound of its predecessor by featuring fewer guitars and more synthesisers and samples. Parker attempted to incorporate his love for pop music into his songwriting for the record through catchier melodies. Many tracks feature ambient sounds recorded by Parker with a dictaphone. The album's theme of isolation is reflected in the album cover, featuring an image of a fenced-off Jardin du Luxembourg in Paris.	vinyl	\N	\N	\N
31	The Low End Theory	A Tribe Called Quest	1991	2499	/images/albumArt/Low-End-Theory.jpg	Hip-Hop	The Low End Theory is the second studio album by American hip hop group A Tribe Called Quest, released on September 24, 1991, by Jive Records. Recording sessions for the album were held mostly at Battery Studios in New York City, from 1990 to 1991. Largely produced by group member Q-Tip, it is a departure from the group's debut album, People's Instinctive Travels and the Paths of Rhythm (1990), enveloping a minimalist sound that combines bass, drum breaks and jazz samples. Lyrically, the album features social commentary, word play, humor and interplay between group members Q-Tip and Phife Dawg.	vinyl	\N	\N	\N
32	A Charlie Brown Christmas	Vince Guaraldi Trio	1965	1999	/images/albumArt/Charlie-Brown.jpg	Jazz	A Charlie Brown Christmas is a 1965 studio album by American jazz pianist Vince Guaraldi (later credited to the Vince Guaraldi Trio). The album was released in December 1965 in the U.S. by Fantasy. It is the soundtrack to the Christmas television special of the same name. Guaraldi composed most of the music, though he included versions of traditional carols such as "O Tannenbaum". He recorded some of the score at Whitney Studio in Glendale, California, then re-recorded some of it at Fantasy Records Studios in San Francisco with a children's choir from St. Paul's Episcopal Church in nearby San Rafael. The sessions ran late into the night, with the children rewarded with ice cream afterward.	vinyl	\N	\N	\N
33	Boss Guitar	Wes Montgomery	1963	1999	/images/albumArt/Boss-Guitar.jpg	Jazz	Boss Guitar is an album by American jazz guitarist Wes Montgomery that was released in 1963 by Riverside. Allmusic jazz critic Scott Yanow called Boss Guitar "Enjoyable if not essential." and David Rickert, for All About Jazz stated, "Montgomery was always at his best as the sole lead instrument, as this recording will attest."	vinyl	\N	\N	\N
34	xx	The xx	2009	2799	/images/albumArt/xx.png	Alternative	xx is the debut album by English indie pop band the xx. It was released on 14 August 2009 by Young Turks, an imprint label of XL Recordings. After signing a record contract with XL, the xx recorded the album from December 2008 to February 2009 at the label's in-house studio in London. Audio engineer Rodaidh McDonald worked with the band during the recording sessions and attempted to reproduce the intimate, unembellished quality of their demos. The band's Jamie Smith produced xx on his laptop and created electronic beats for the songs, which he then mixed in a detailed process with McDonald. Although the xx had been strongly influenced by R&B acts, the album also drew comparisons from critics to alternative rock, electronica, and post-punk sounds. The melancholic songs on xx featured minimalist arrangements and were built around Smith's beats, Oliver Sim's basslines, and sparse guitar figures played by Baria Qureshi and Romy Madley Croft, who employed reverb in her lead guitar parts. Most of them were sung as low-key duets by Croft and Sim, both of whom wrote emotional lyrics about love, intimacy, loss, and desire.\r\n\r\n	vinyl	\N	\N	\N
35	Fragile	Yes	1971	2399	/images/albumArt/Fragile.jpg	Rock	Fragile is the fourth studio album by English rock band Yes, released in November 1971 by Atlantic Records. Following a successful tour in promotion of The Yes Album (1971), the band regrouped in London to work on a follow-up. Early into the sessions, keyboardist Tony Kaye was fired over his reluctance to play synthesisers, and was replaced with Rick Wakeman of the Strawbs, whose experience with a wider variety of keyboards expanded the band's sound. Four tracks on Fragile are group compositions; the remaining five are solo pieces written by each member. The album's artwork was the first to be designed by Roger Dean, who would design many of their future covers and stage sets.	vinyl	\N	\N	\N
36	Young the Giant	Young the Giant	2011	2199	/images/albumArt/Young-the-Giant.jpg	Alternative	Young the Giant is the debut album by American indie rock band Young the Giant. It was released digitally by the Roadrunner record label on October 26, 2010, and was followed by a physical CD and vinyl release in the United States on January 25, 2011. The album was released in the United Kingdom on May 2, 2011. The band began work on the album with producer Joe Chiccarelli, engineers Lars Fox and Ian Kirkpatrick, and mixer Michael H. Brauer in early 2010. Young the Giant lead singer Sameer Gadhia described the album as having a "summery, kind of an Orange County sound." Songs on the album include the U.S. single "My Body", which reached the top five of Billboard's Alternative Songs chart; "Apartment", the first international single; and "Cough Syrup", which was originally recorded for the 2008 EP Shake My Hand when the band was known as The Jakes.	vinyl	\N	\N	\N
37	\N	\N	\N	9999	/images/turntables/ATLP60-BLK.jpg	\N	Whether you’re just getting into records, rediscovering a record collection long since buried away or simply adding a turntable to complete your system, the AT-LP60X fully automatic belt-drive turntable is an excellent choice. This affordable, easy-to-use turntable plays both 33-1/3 and 45 RPM records and, with its built-in switchable phono preamp, can be connected directly to your home stereo, powered speakers, computer and other components, whether they have a dedicated phono input or not. The turntable comes with a detachable RCA output cable (3.5 mm male to dual RCA male), 45 RPM adapter, and a removable hinged dust cover.	turntable	AT-LP60X	Audio Technica	Black
38	\N	\N	\N	9999	/images/turntables/ATLP60-RED.jpg	\N	Whether you’re just getting into records, rediscovering a record collection long since buried away or simply adding a turntable to complete your system, the AT-LP60X fully automatic belt-drive turntable is an excellent choice. This affordable, easy-to-use turntable plays both 33-1/3 and 45 RPM records and, with its built-in switchable phono preamp, can be connected directly to your home stereo, powered speakers, computer and other components, whether they have a dedicated phono input or not. The turntable comes with a detachable RCA output cable (3.5 mm male to dual RCA male), 45 RPM adapter, and a removable hinged dust cover.	turntable	AT-LP60X	Audio Technica	Red
39	\N	\N	\N	9999	/images/turntables/ATLP60-WHT.jpg	\N	Whether you’re just getting into records, rediscovering a record collection long since buried away or simply adding a turntable to complete your system, the AT-LP60X fully automatic belt-drive turntable is an excellent choice. This affordable, easy-to-use turntable plays both 33-1/3 and 45 RPM records and, with its built-in switchable phono preamp, can be connected directly to your home stereo, powered speakers, computer and other components, whether they have a dedicated phono input or not. The turntable comes with a detachable RCA output cable (3.5 mm male to dual RCA male), 45 RPM adapter, and a removable hinged dust cover.	turntable	AT-LP60X	Audio Technica	White
40	\N	\N	\N	29999	/images/turntables/uturn-blue.jpg	\N	Get more out of your records with the Orbit Plus. U-Turn Audio's acrylic platter doesn’t just sit there looking pretty - it provides improved speed stability and dissipates unwanted resonances. The result: more lifelike tonality and punchier bass. The Plus also features the Ortofon OM5E cartridge, which is perfect for listeners who enjoy a wide variety of genres. Includes turntable, dust cover, felt mat, AC Acapter, RCA cables.	turntable	Orbit Plus	U-Turn Audio	Blue
41	\N	\N	\N	29999	/images/turntables/uturn-red.jpg	\N	Get more out of your records with the Orbit Plus. U-Turn Audio's acrylic platter doesn’t just sit there looking pretty - it provides improved speed stability and dissipates unwanted resonances. The result: more lifelike tonality and punchier bass. The Plus also features the Ortofon OM5E cartridge, which is perfect for listeners who enjoy a wide variety of genres. Includes turntable, dust cover, felt mat, AC Acapter, RCA cables.	turntable	Orbit Plus	U-Turn Audio	Red
42	\N	\N	\N	29999	/images/turntables/uturn-blk.jpg	\N	Get more out of your records with the Orbit Plus. U-Turn Audio's acrylic platter doesn’t just sit there looking pretty - it provides improved speed stability and dissipates unwanted resonances. The result: more lifelike tonality and punchier bass. The Plus also features the Ortofon OM5E cartridge, which is perfect for listeners who enjoy a wide variety of genres. Includes turntable, dust cover, felt mat, AC Acapter, RCA cables.	turntable	Orbit Plus	U-Turn Audio	Black
43	\N	\N	\N	39999	/images/turntables/pro-ject-grey.jpg	\N	The first Debut turntable, introduced in the late 1990s, was a revolution for the hi-fi industry. The new Debut Carbon DC was designed to set new standards in this category for the coming decade – as perfectly timed as analogue is today, it’s again a respected source, while the demand for good turntables is growing again! The most obvious improvement is the inclusion of a Carbon tube for the tonearm, which increases stiffness and decreases unwanted resonance. Together with other improvements like an increase in platter size and weight to realize even smoother rotation, the overall sound quality is greatly improved. The approved belt drive design offers a low noise AC motor with effective motor decoupling (utilising TPE-damping) and ultra precision frequency DC-driven AC generator (like the Speed Box) for ultimate speed stability without unwanted vibration. Included is Debut Carbon (DC) with Ortofon 2M red, Power Supply, Dust Cover, Felt Mat, Adapter for 7“ Singles and Connect it E RCA Cable.	turntable	Debut Carbon DC	Pro-Ject	Grey
44	\N	\N	\N	39999	/images/turntables/pro-ject-ppl.jpg	\N	The first Debut turntable, introduced in the late 1990s, was a revolution for the hi-fi industry. The new Debut Carbon DC was designed to set new standards in this category for the coming decade – as perfectly timed as analogue is today, it’s again a respected source, while the demand for good turntables is growing again! The most obvious improvement is the inclusion of a Carbon tube for the tonearm, which increases stiffness and decreases unwanted resonance. Together with other improvements like an increase in platter size and weight to realize even smoother rotation, the overall sound quality is greatly improved. The approved belt drive design offers a low noise AC motor with effective motor decoupling (utilising TPE-damping) and ultra precision frequency DC-driven AC generator (like the Speed Box) for ultimate speed stability without unwanted vibration. Included is Debut Carbon (DC) with Ortofon 2M red, Power Supply, Dust Cover, Felt Mat, Adapter for 7“ Singles and Connect it E RCA Cable.	turntable	Debut Carbon DC	Pro-Ject	Purple
45	\N	\N	\N	39999	/images/turntables/pro-ject-yellow.jpg	\N	The first Debut turntable, introduced in the late 1990s, was a revolution for the hi-fi industry. The new Debut Carbon DC was designed to set new standards in this category for the coming decade – as perfectly timed as analogue is today, it’s again a respected source, while the demand for good turntables is growing again! The most obvious improvement is the inclusion of a Carbon tube for the tonearm, which increases stiffness and decreases unwanted resonance. Together with other improvements like an increase in platter size and weight to realize even smoother rotation, the overall sound quality is greatly improved. The approved belt drive design offers a low noise AC motor with effective motor decoupling (utilising TPE-damping) and ultra precision frequency DC-driven AC generator (like the Speed Box) for ultimate speed stability without unwanted vibration. Included is Debut Carbon (DC) with Ortofon 2M red, Power Supply, Dust Cover, Felt Mat, Adapter for 7“ Singles and Connect it E RCA Cable.	turntable	Debut Carbon DC	Pro-Ject	Yellow
46	\N	\N	\N	99999	/images/turntables/rega-blk.jpg	\N	Replacing the multi award winning and five times What Hi-Fi? Product of the Year (Rega RP3) was never going to be an easy task. It took our team of designers headed up by Rega's Roy Gandy, two years to develop the all new 'Planar 3' following the biggest re-design of the iconic 'Three' model ever seen. Our team have worked tirelessly to improve every aspect of this turntable offering improved ergonomics, usability and first and foremost, sonic performance.The new ‘Planar 3’ is truly a new turntable carrying over just two components from the previous model. WHAT Hi-Fi? PRODUCT OF THE YEAR AWARD WINNER for 2016, 2017, 2018 and 2019!	turntable	Planar 3	Rega	Black
47	\N	\N	\N	99999	/images/turntables/rega-wht.jpg	\N	Replacing the multi award winning and five times What Hi-Fi? Product of the Year (Rega RP3) was never going to be an easy task. It took our team of designers headed up by Rega's Roy Gandy, two years to develop the all new 'Planar 3' following the biggest re-design of the iconic 'Three' model ever seen. Our team have worked tirelessly to improve every aspect of this turntable offering improved ergonomics, usability and first and foremost, sonic performance.The new ‘Planar 3’ is truly a new turntable carrying over just two components from the previous model. WHAT Hi-Fi? PRODUCT OF THE YEAR AWARD WINNER for 2016, 2017, 2018 and 2019!	turntable	Planar 3	Rega	White
48	\N	\N	\N	99999	/images/turntables/rega-red.jpg	\N	Replacing the multi award winning and five times What Hi-Fi? Product of the Year (Rega RP3) was never going to be an easy task. It took our team of designers headed up by Rega's Roy Gandy, two years to develop the all new 'Planar 3' following the biggest re-design of the iconic 'Three' model ever seen. Our team have worked tirelessly to improve every aspect of this turntable offering improved ergonomics, usability and first and foremost, sonic performance.The new ‘Planar 3’ is truly a new turntable carrying over just two components from the previous model. WHAT Hi-Fi? PRODUCT OF THE YEAR AWARD WINNER for 2016, 2017, 2018 and 2019!	turntable	Planar 3	Rega	Black
49	\N	\N	\N	8999	/images/accessories/cork-mat.jpg	\N	Music Hall's Aztec Blue Cork record is an upgrade to their popular Cork mat with enhanced decoupling cork material and improved dual layer design. Aside from looking cool, these cork mats actually improve the sound of your favorite records, as well as lower record wear and improves stylus tracking. How does a slipmat do all this? The secret is in the unique design. The outer pieces of cork that surround the outside of the mat lift and support the record while floating it above and decoupling it from the platter. This lowers record vibration and reduces acoustic feedback. Stylus tracking is improved and record wear reduced. The mat eliminates the grunge and leaves behind a rich, clear, dynamic sound. In addition, the cork material sucks up unwanted vibrations and is naturally non-static and non-adhesive making it completely safe for all platter types and all records. Cork also grips the record better than the usual felt-type materials so there is less record slippage and fewer timing errors. This thin, lightweight mat is an excellent upgrade for all listening turntable setups (but NOT for DJing or backcueing).	accessories	Aztec Blue Cork Mat	Music Hall	\N
50	\N	\N	\N	42999	/images/accessories/cables.jpg	\N	Audioquest's Rocket 33 Speaker Cable features exceptional single bi-wire construction that deliver well balanced, spacious and detailed sound. The cable has two sets of connectors to connect to the woofer and tweeter inputs seperately, which until now, required two sets of cables. This single bi-wire cable is not only simper to connect, but also more affordable. Complex materials and design to offer the cleanest, distortion-free transmission of sound with solid Long-Grain Copper +PSC wire, Double Star-Quad geometry, Spread-Spectrum technology (for less distortion / interference), and other technologies to transmit the purest audio signal to your speakers.	accessories	Rocket 33 Single-BiWire Speaker Cable	Audioquest	\N
51	\N	\N	\N	9199	/images/accessories/rca-cables.jpg	\N	Audioquest's Golden Gate series (named after the famous SF bridge) utilizes complex materials and design to offer the cleanest, distortion-free transmission of sound. The Golden Gate series utilizes Perfect Surface Copper wire, air-filled wire insulation (for less distortion / interference), and other technologies to transmit your the purest audio signal from point A to point B.	accessories	Golden Gate Audio Interconnect Cable	Audioquest	\N
52	\N	\N	\N	46999	/images/accessories/a5.jpg	\N	Audioengine's A5+ Premium Powered Bookshelf Speakers offer award-winning sound for all your music, requires no amp or receiver, and are wireless-ready. These speakers offer deep, powerful bass thanks to kevlar woofers, smooth highs from silk tweeters, built-in power amplifiers, truly useful connections, and a clean industrial design. They feature custom designed and manufactured parts (woofers, tweeters, etc) hand crafted wood cabinets, and a handsome bamboo finish. Best of all, the A5's offer unique features like a built-in USB power port to power your wireless products and stream music, or keep your iPod charged. Comes with all cables, and drawstring carry bags. Recommended.	accessories	A5+ Powered Bookshelf Speaker System - Bamboo	Audioengine	\N
53	\N	\N	\N	119999	/images/accessories/dali.jpg	\N	The DALI OBERON 5 is the ultimate performer - a compact and elegant floor-standing speaker, housing 2 x 5¼” wood fibre based woofers with SMC and the series’ wide bandwidth 29 mm ultra-lightweight soft dome tweeter. This slim floor-stander will surprise with its ability to deliver a deep firm bass together with a clear and well defined mid-range and airy high frequencies.	accessories	Oberon 5 Passive Floorstanding Speakers - Black (Pair)	Dali	\N
54	\N	\N	\N	21999	/images/accessories/kanto.jpg	\N	"Proudly designed in Canada, the YU2 desktop mini-monitor will make you believe that big sound can come in a small package." - Kanto	accessories	YU2 Powered Bookshelf Speakers - Matte Black	Kanto	\N
\.


--
-- Name: cartItems_cartItemId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."cartItems_cartItemId_seq"', 215, true);


--
-- Name: carts_cartId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."carts_cartId_seq"', 64, true);


--
-- Name: orders_orderId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."orders_orderId_seq"', 3, true);


--
-- Name: products_productId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."products_productId_seq"', 1, false);


--
-- Name: cartItems cartItems_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."cartItems"
    ADD CONSTRAINT "cartItems_pkey" PRIMARY KEY ("cartItemId");


--
-- Name: carts carts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_pkey PRIMARY KEY ("cartId");


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY ("orderId");


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY ("productId");


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: -
--

GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

