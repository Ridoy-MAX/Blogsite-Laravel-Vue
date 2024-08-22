-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 22, 2024 at 10:02 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `example_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `status` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `view` varchar(255) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `user_id`, `slug`, `title`, `description`, `status`, `image`, `view`, `created_at`, `updated_at`) VALUES
(8, 13, 'ratione-id-suscipit', 'Top 15 Movie Blogs for Film Fans to Follow - IZEA', 'Movie fans, unite! Whether you’re a fan of blockbuster hits or indie films, there are a handful of top-rated movie blogs that can keep you in-the-know. Many of the blogs focus on headline news and casting reveals, but there are some niche blogs that focus on specific kinds of movies or family-specific reviews.\n\n15 movie blogs fans should follow\nIMBd\nMost people have heard of IMBd. If you’ve ever wondered, ‘Who played Yoda?’ or ‘What movies has Sandra Bullock starred in?’, you’ve been to IMBd. The site offers profiles, cast lists, plot summaries, movie news, and reviews. Three million fans follow the site on Instagram for trailers like this one to “Marry Me” and exclusive interviews like this one with Kristen Bell. \n\nMovieWeb\nFor all the updates on your favorite movies, MovieWeb is the place to go. Fans find information on casting and release dates along with trailers and clips of their favorite flicks. With its start dating back to 1995, it’s a trusted source for movie information. Its Instagram is full of updates, like news of a “Christmas Story” sequel and first looks of cult favorite, “Hocus Pocus 2.”\n\nCinemaBlend\nA popular entertainment site, CinemaBlend is all about movies, hit TV shows and the best hits to binge. With 5-10 posts added to the site each day and an Instagram account full of headlines like Dakota Johnson joining Spiderman’s Universe, fans can’t get enough of the juicy news. \n\n\nRotten Tomatoes\nNeed a movie recommendation? Head to Rotten Tomatoes. It’s one of the oldest and most trusted online review sites for movies, with its start reaching back to 1998. In addition to reading a review or leaving one, fans also get news and a YouTube channel full of content like the best Black movies and Andrew Garfield’s five favorite musicals.\n\nScreen Rant\nDescribed as the ultimate geek entertainment destination, Screen Rant provides an editorialized spin on headline news that engages its audience. It has 8 million subscribers on YouTube with contributors giving their two cents on why things like Mirabel didn’t get her gift in “Encanto” to comedic Pitch Meetings. \n\n\nCommon Sense Media\nWondering if the latest hit movie is appropriate for your child? Common Sense Media can help. This site provides reviews with families in mind along with age-based ratings. Parents and educators can also search for age-appropriate movies and TV shows. The nonprofit’s Instagram account has a list of cold weather movies to watch and reviews like this one for “Moonfall.”', 'Active', '/images/1724345381.webp', '6', '2024-08-22 10:49:41', '2024-08-22 13:49:46'),
(9, 13, 'nihil-deserunt-excep', 'Oddity Review: A Haunting Tale of Grief and the Supernatural', 'Atmosphere as a Character\nFrom the opening scenes, Oddity establishes a chilling mood, with its shadowy, creaking country house and the eerie silence of the countryside. The film’s setting plays a pivotal role, almost becoming a character in itself. The house, filled with dark corners and whispering walls, serves as a perfect stage for the unfolding of the supernatural elements that drive the story forward. McCarthy’s direction and the cinematography work hand in hand to create a claustrophobic atmosphere, where every creak and groan of the house could signify the approach of something malevolent.\n\nCompelling Performances, Especially in Dual Roles\nCarolyn Bracken delivers a compelling dual performance as both Dani and Darcy, the twin sisters around whom the plot revolves. Her portrayal of Darcy, the blind medium, is particularly notable. Bracken embodies the character’s grief and determination, making her struggle feel personal and raw. Darcy’s blindness adds an extra layer of tension to the film; her reliance on her other senses and psychic abilities heightens the suspense, as the audience is left to imagine what might be lurking just out of her reach.\n\nGwilym Lee, as Ted Timmis, also offers a nuanced performance. Ted’s character is complex, balancing between the facade of a caring husband and the darker aspects that slowly unravel as the plot thickens. The dynamic between Ted and Darcy is the heart of the film, with their interactions teetering between uneasy cordiality and underlying hostility. Lee’s portrayal of Ted’s inner turmoil and eventual descent into paranoia is one of the film’s highlights.\n\nThe Mannequin: A Symbol of Unresolved Mysteries\nThe introduction of the wooden mannequin from Darcy’s cabinet of curiosities is where Oddity veers into more traditional horror territory. The mannequin, with its lifeless gaze and unsettling presence, becomes a symbol of the unresolved mysteries and the supernatural forces at play. McCarthy uses the mannequin effectively to escalate the tension, with its inexplicable movements and the strange objects hidden within it adding to the film’s creeping dread.\n\nMcCarthy’s screenplay is methodical, with a slow-burn approach that gradually builds suspense. The narrative is rich in detail, weaving together the psychological and supernatural elements seamlessly. However, this slow pacing might not appeal to all viewers. The film takes its time to reveal its secrets, and while this allows for a deeper connection with the characters, it also means that some moments feel drawn out. For those who prefer a faster-paced thriller, this might be a point of contention.\n\nEffective Use of Sound and Silence\nOne of the film’s strengths lies in its sound design. The use of silence is particularly effective, with long stretches of quiet amplifying the tension. When sound is used, it’s done sparingly but to great effect. The creaking of floorboards, the rustling of leaves, and the eerie chime of the haunted bell all contribute to a soundscape that keeps the audience on edge.\n\nThematically, Oddity explores the idea of grief as a catalyst for horror. Darcy’s mourning for her sister and her determination to uncover the truth about Dani’s death drives the narrative. This emotional core gives the film depth, grounding the supernatural elements in a story about loss and the lengths one might go to for closure. The film also touches on themes of betrayal and guilt, particularly in the character of Ted, whose secrets slowly come to light as the plot unfolds.\n\nA Few Missteps in the Narrative\nHowever, Oddity is not without its flaws. While the film’s atmosphere and performances are strong, the plot occasionally stumbles under the weight of its own ambitions. Some of the story’s twists and turns, while intriguing, feel underdeveloped, leaving the audience with more questions than answers. Additionally, the film’s resolution might come across as unsatisfying for those expecting a more conclusive ending. McCarthy seems to prefer leaving certain elements ambiguous, which might frustrate viewers looking for clear-cut answers.\n\nAnother point of critique is the character of Yana, played by Caroline Menton. While she serves as a foil to Darcy, her role feels somewhat underutilized. Yana’s presence in the film seems more like a plot device than a fully realized character, and her interactions with Darcy, though tense, lack the depth found in other parts of the narrative. This leaves her character feeling somewhat extraneous to the central plot.\n\nVisually, Oddity is a haunting experience. The cinematography, with its muted color palette and careful framing, enhances the film’s unsettling tone. The use of light and shadow is particularly noteworthy, creating a visual contrast that mirrors the film’s thematic exploration of hidden truths and buried secrets. The country house, with its labyrinthine corridors and hidden nooks, is shot in a way that makes it feel both expansive and claustrophobic, adding to the film’s sense of unease.\n\nOverall:\nOddity is a film that excels in atmosphere and character-driven storytelling. Damian Mc Carthy has crafted a supernatural thriller that, while not perfect, offers enough chills and psychological intrigue to keep viewers engaged. The film’s slow pacing and occasional narrative missteps might not make it a universal crowd-pleaser, but for those who appreciate a methodical build-up and a story steeped in mood and tension, Oddity is worth a watch. It’s a film that lingers in the mind, much like the ghostly presence it portrays, leaving viewers pondering the fine line between reality and the supernatural long after the credits roll.', 'Active', '/images/1724345404.jpg', '12', '2024-08-22 10:49:56', '2024-08-22 13:55:54'),
(11, 13, 'ex-dolor-voluptas-vi', 'The Lord of the Rings: The War of the Rohirrim Trailer Debuts Today!', 'A Return to Middle-earth\r\nAward-winning filmmaker Kenji Kamiyama directs The Lord of the Rings: The War of the Rohirrim. He is known for Blade Runner: Black Lotus and Ghost in the Shell: Stand Alone Complex. The story unfolds 183 years before the events of the original trilogy. The film centers on Helm Hammerhand, the mighty King of Rohan, voiced by Brian Cox. It tells the story of his house’s heroic last stand at Helm’s Deep, a fortress recognized from The Lord of the Rings: The Two Towers.\r\n\r\nThe narrative follows Helm as he leads his people against Wulf, a cunning and ruthless Dunlending lord. Wulf seeks vengeance for his father’s death. As the situation becomes dire, Helm’s daughter, Héra, voiced by Gaia Wise, emerges as a key leader. She plays a crucial role in resisting Wulf’s forces. Her bravery and determination become central to her people’s survival. This tale highlights courage, sacrifice, and resilience.\r\n\r\n\r\nA Stellar Voice Cast\r\nTHE LORD OF THE RINGS: THE WAR OF THE ROHIRRIM\r\n\r\nThe film boasts a talented voice cast, including Luke Pasqualino as Wulf, and the return of Miranda Otto, who reprises her role as Éowyn, the Shieldmaiden of Rohan, serving as the story’s narrator. The ensemble also features Lorraine Ashbourne, Yazdan Qafouri, Benjamin Wainwright, Laurence Ubong Williams, Shaun Dooley, Michael Wildman, Jude Akuwudike, Bilal Hasna, and Janine Duvitski.\r\n\r\nA Masterpiece in the Making\r\nJeffrey Addiss, Will Matthews, Phoebe Gittins, and Arty Papageorgiou wrote the screenplay for The Lord of the Rings: The War of the Rohirrim, based on characters created by J.R.R. Tolkien. The production team features Oscar winner Philippa Boyens, known for her work on The Lord of the Rings and The Hobbit trilogies, alongside Jason DeMarco and Joseph Chou, who collaborated on Blade Runner: Black Lotus.\r\n\r\nThe creative team from The Lord of the Rings Trilogy returns to bring this new chapter to life. This includes Oscar winners Alan Lee and Richard Taylor, and esteemed Tolkien illustrator John Howe. Their combined expertise ensures that The War of the Rohirrim will be a visually stunning and emotionally impactful addition to the Lord of the Rings franchise.\r\n\r\n\r\nMark Your Calendars\r\nTHE LORD OF THE RINGS: THE WAR OF THE ROHIRRIM\r\nThe Lord of the Rings: The War of the Rohirrim is set to be a cinematic event, bringing Tolkien’s world to life in a new and exciting way. Distributed by Warner Bros. Pictures, the film will be released in theaters nationwide on December 13, 2024, with international releases beginning on December 11, 2024. Fans of Middle-earth won’t want to miss this epic tale of bravery, betrayal, and the enduring legacy of the Rohirrim.\r\n\r\n \r\n\r\nBe sure to follow E-Man’s Movie Reviews on Facebook, Subscribe on YouTube, or follow me on Twitter/IG @EmansReviews for even more movie news and reviews', 'Active', '/images/1724356293.jpg', '6', '2024-08-22 10:50:53', '2024-08-22 13:58:13'),
(13, 13, 'nulla-quisquam-cum-e', 'Robert Downey Jr. Returns to Marvel: Doctor Doom', 'By Anthony Whyte  August 22, 2024  7 min read  In Movie News Chat\r\nIt seems like Robert Downey Jr. just can’t quit Marvel Studios. After a decade of redefining what it means to be a superhero as Tony Stark, he’s stepping into the shoes—or rather, the iron-clad boots—of one of Marvel’s most iconic villains: Doctor Doom. Yes, you read that right. The man who made you believe in billionaires with a heart of gold is now set to play the MCU’s most cunning and ruthless antagonist in the upcoming Avengers: Doomsday and Avengers: Secret Wars.\r\n\r\nBut here’s the kicker: the timeline of Downey’s casting as Doctor Doom raises some serious questions. With Marvel Studios having some Avengers-sized drama on their hands following the legal issues surrounding Jonathan Majors, it seems like RDJ was locked in for Doom’s role before the ink was dry on Majors’ termination papers. This leaves us all wondering if Marvel had this switcheroo planned all along.\r\n\r\nThe Timing: When Did Marvel Approach RDJ?\r\nBob Iger Kevin FeigeLet’s talk about timing. When news broke of Robert Downey Jr.’s return to Marvel, fans were hyped. But what wasn’t so clear was when Marvel Studios head honcho Kevin Feige and Disney CEO Bob Iger first approached him about taking on the role of Doctor Doom. If we look at the calendar, Jonathan Majors was still very much in the MCU’s plans when the rumor mill started churning about RDJ’s return. It’s almost as if Marvel knew they needed a heavy hitter to fill the looming void and went straight to the guy who helped build the house.\r\n\r\nMajors, who had a promising career as Kang the Conqueror, was embroiled in legal troubles that eventually led to Marvel cutting ties with him. But here’s the thing: while the world was still grappling with the fallout from Majors’ departure, Robert Downey Jr. was already in advanced talks to bring Doctor Doom to life. Coincidence? Or was Feige playing 4D chess? You decide.\r\n\r\nRDJ as Doctor Doom\r\nkevin-feige-robert-downey-jr-avengers-759Robert Downey Jr. as Doctor Doom might seem like an odd choice at first glance, but there’s a presumed rationality behind the decision. Doom, like Stark, is a character driven by ego, brilliance, and an unrelenting desire for power. Downey has already proven he can play a genius with a knack for technology, and now he gets to explore the darker side of brilliance.\r\n\r\nDoom isn’t just another villain; he’s the villain in the Marvel Universe. With his intellect, mysticism, and political savvy, he’s a formidable foe for the Avengers. RDJ’s return as Doctor Doom also signals a major shift in the MCU’s narrative. With Avengers: Doomsday and Avengers: Secret Wars on the horizon, Marvel seems to be gearing up for some of its most ambitious storytelling yet. Bringing in a character like Doom suggests that the stakes are about to get even higher.\r\n\r\nAnd let’s not forget the legacy aspect. RDJ returning as Doom while Tony Stark’s memory still looms large over the MCU is a bold move. It’s almost as if Marvel is saying, “You thought you knew what to expect from us? Think again.” It’s a move that could redefine the MCU’s next phase, much like how Iron Man kick-started the whole thing in 2008.\r\n\r\nConclusion: From Hero to Villain—RDJ’s Next Big Marvel Role\r\nRobert Downey Jr. taking on the mantle of Doctor Doom is the kind of casting that could make or break the next chapter of the MCU. Given his track record, I’d bet on him delivering something unforgettable. Whether this is part of a larger redemption arc for Doom or simply Marvel flexing its star power, one thing is clear: the MCU is far from done with Robert Downey Jr., and neither are we.\r\n\r\nSo, as we wait for Avengers: Doomsday and Avengers: Secret Wars, keep an eye on how Marvel weaves this new chapter into the larger tapestry. The MCU might be in for a darker, more complex phase, but with Downey leading the charge as Doctor Doom, it’s bound to be one hell of a ride.\r\n\r\n(Source: THR)', 'Active', '/images/1724356359.jpg', '4', '2024-08-22 10:51:15', '2024-08-22 13:52:39'),
(14, 13, 'quo-sunt-totam-liber', 'Ms. Marvel Season 2: What’s Next for the Marvel Superhero?', 'By Anthony Whyte  August 22, 2024  6 min read  In TV Chat\r\nMarvel Studios is buzzing with speculation about the future of Kamala Khan, aka Ms. Marvel. Fresh off her breakout role in The Marvels and a place in the upcoming Marvel Zombies, Ms. Marvel might just be on her way to a second season. Yes, you heard that right—season 2 could be on the horizon. Let’s dive into what this might mean for our favorite teen superhero and the broader MCU.\r\n\r\nMs. Marvel: From Newcomer to Marvel Powerhouse\r\nIman Vellani’s portrayal of Ms. Marvel brought a refreshing twist to the Marvel Television lineup. Her charming, geeky, and genuine depiction of Kamala Khan won hearts and set the stage for her future in the MCU. The first season of Ms. Marvel was a hit, praised for its blend of comedy and drama, its authentic representation of Pakistani-American culture, and its creative use of animation to show Kamala’s inner thoughts and daydreams.\r\n\r\nHowever, not everyone was a fan of the superhero action. Some critics felt the superhero scenes lacked the punch compared to the show’s more personal moments. But even with these critiques, the first season proved that Kamala Khan is more than just a passing phase in the MCU.\r\n\r\nThe Buzz About Ms. Marvel Season 2\r\nAccording to Daniel Richtman, a reliable leaker in the Marvel sphere, discussions about a second season of Ms. Marvel are heating up. While nothing is set in stone just yet, the buzz suggests that Marvel Studios is seriously considering it. Given Kamala’s growing prominence in the MCU, it’s no surprise that fans and insiders alike are eager to see more of her adventures.\r\n\r\nThe first season left us with plenty of questions and room for expansion. Kamala’s role in The Marvels and her future in Young Avengers have set the stage for more thrilling storylines. If season 2 gets the green light, expect deeper dives into her superhero life, more connections with other MCU characters, and perhaps even some new powers or enemies.\r\n\r\nWhat’s Next for Ms. Marvel in the MCU?\r\nKamala Khan’s future in the MCU looks bright. She’s not just a sidekick or a supporting character; she’s a central player in upcoming projects. Besides being a main character in Marvel Zombies, she’s also set to play a significant role in the Young Avengers project. Kamala is essentially shaping up to be a key player in the new wave of Marvel superheroes.\r\n\r\nThe buzz about a potential second season could mean more chances to explore her character and the unique cultural aspects that made the first season stand out. Fans can look forward to seeing how Kamala’s character evolves and how her story intertwines with the larger MCU narrative.\r\n\r\nThe Marvel Television Landscape\r\nMarvel Television has been expanding rapidly, and shows like Ms. Marvel are helping shape the future of the MCU. With other shows like Hawkeye also rumored for a second season, it’s clear that Marvel Studios is committed to exploring more stories within their universe. Whether or not Ms. Marvel gets a second season, it’s clear that her impact on the MCU is far from over.\r\n\r\nConclusion\r\nThe potential for Ms. Marvel Season 2 is exciting news for fans of the MCU. Kamala Khan has quickly become a beloved character, and there’s a lot of promise for her future adventures. Whether she’s fighting zombies or leading the Young Avengers, it’s clear that Kamala’s journey is far from finished. Stay tuned for more updates, and let’s hope that Marvel Studios gives the green light for Season 2 soon!', 'Active', '/images/1724356401.jpg', '9', '2024-08-22 10:51:28', '2024-08-22 13:55:56'),
(16, 13, 'amet-sunt-porro-dol', 'Alien: Earth – Noah Hawley Takes the Xenomorph to New Heights', 'The Alien franchise is getting a fresh burst of life, and it’s all thanks to Noah Hawley. If you’re still haunted by nightmares of the Xenomorph from Ridley Scott’s 1979 classic, get ready to revisit that terror in a whole new way with the upcoming FX series Alien: Earth. Not to be confused with Alien: Romulus—which is still lurking in box offices—this series is set to explore the prequel territory, bringing the horror down to Earth, quite literally.\r\n\r\nWhat’s the Buzz?\r\nNoah Hawley, the mastermind behind FX’s Fargo, has turned his attention to the Alien universe, and let’s just say he’s not playing it safe. Alien: Earth is a prequel to the original 1979 film, diving 30 years before the Nostromo first encountered that chest-bursting menace. But don’t expect any of the philosophical pondering from the Prometheus movies. Hawley’s keeping it gritty, grounded, and (hopefully) nightmare-inducing.\r\n\r\nThe series is already in post-production, with Hawley boasting that this project could consume the next decade of his life. And honestly, who wouldn’t want to be obsessed with aliens for ten years? According to Hawley, fans of the franchise are in for something special. Translation: keep your lights on when you watch this one.\r\n\r\nMeet the Crew\r\nThe cast is a mixed bag of talent, from Sydney Chandler to Timothy Olyphant. If you’ve got a knack for recognizing faces, you’ll also spot Alex Lawther, Essie Davis, and Adarash Gourav. These actors are set to dive deep into a plot that promises to intertwine with the events of the first Alien film. While specifics are still as elusive as a facehugger in the vents, we do know this—Hawley’s steering clear of the Prometheus plot points. Good call, right?\r\n\r\nWhy Alien: Earth Matters\r\nLet’s get real—Alien: Earth isn’t just another spin-off. It’s a chance for the franchise to expand in a way we haven’t seen before. By setting the series on Earth, Hawley brings the terror closer to home. It’s one thing to be hunted in space, but knowing those creatures could be lurking in your backyard? That’s a whole new level of terror.\r\n\r\nPlus, this series could be the missing link between the original Alien and the newer entries like Romulus. And with Hawley’s track record, we’re expecting nothing less than a deep, dark dive into the lore that has kept fans on the edge of their seats for over four decades.\r\n\r\nWhat’s Next?\r\nHawley is deep into post-production, tweaking the visual effects to ensure the Xenomorphs are as horrifying as ever. The show is on track for a 2025 release, and the buzz around it is already building. Whether you’re a die-hard fan or new to the Alien universe, Alien: Earth is shaping up to be must-watch TV.\r\n\r\nSo, grab your popcorn, maybe a stress ball, and prepare to revisit a universe where no one can hear you scream—even if you’re on Earth.', 'Active', '/images/1724356453.jpg', '4', '2024-08-22 12:56:52', '2024-08-22 13:56:14'),
(17, 13, 'quia-voluptate-conse', 'Quia voluptate conse', 'Non sed pariatur Vo', 'Active', '/images/1724355077.jpg', '1', '2024-08-22 13:31:17', '2024-08-22 13:56:39'),
(18, 13, 'vel-distinctio-dist', 'Vel distinctio Dist', 'Enim culpa delectus', 'Deactive', '/images/1724355094.jpg', '3', '2024-08-22 13:31:34', '2024-08-22 13:56:18'),
(19, 13, 'aliquip-et-ab-id-nos', 'Aliquip et ab id nos', 'Omnis qui aliquid in', 'Deactive', '/images/1724356620.jpg', '0', '2024-08-22 13:57:00', '2024-08-22 13:57:00'),
(20, 13, 'dolorum-quo-nemo-sin', 'Dolorum quo nemo sin', 'Nihil voluptas offic', 'Deactive', '/images/1724356649.jpg', '0', '2024-08-22 13:57:29', '2024-08-22 13:57:58');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('admin@admin.com|127.0.0.1', 'i:1;', 1724087300),
('admin@admin.com|127.0.0.1:timer', 'i:1724087300;', 1724087300);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `subject`, `message`, `created_at`, `updated_at`) VALUES
(1, 'Quincy Coffey', 'huxuvex@mailinator.com', 'Omnis nobis quas aut', 'Cupiditate exercitat', '2024-08-22 13:13:53', '2024-08-22 13:13:53'),
(2, 'Derek Carr', 'wocytuhyzu@mailinator.com', 'Illo sit et eiusmod', 'Provident tempore', '2024-08-22 13:14:46', '2024-08-22 13:14:46'),
(3, 'Chastity Kidd', 'makas@mailinator.com', 'Do iste explicabo F', 'Eius vitae est accus', '2024-08-22 13:29:06', '2024-08-22 13:29:06'),
(4, 'Morgan Bates', 'mubat@mailinator.com', 'Illo ea cupidatat qu', 'Necessitatibus omnis', '2024-08-22 13:29:12', '2024-08-22 13:29:12'),
(5, 'Isadora Ewing', 'wilusirok@mailinator.com', 'Sequi animi ut et e', 'Molestiae nostrum ni', '2024-08-22 13:29:17', '2024-08-22 13:29:17'),
(6, 'Mariam Gentry', 'wevyzyru@mailinator.com', 'A qui cillum consequ', 'Aut laboris obcaecat', '2024-08-22 13:29:22', '2024-08-22 13:29:22'),
(7, 'Nerea Campbell', 'newymunyq@mailinator.com', 'Sed incididunt adipi', 'Est et ut assumenda', '2024-08-22 13:29:27', '2024-08-22 13:29:27'),
(8, 'MacKenzie Vaughan', 'wunumuz@mailinator.com', 'Soluta lorem et ea e', 'Provident consequun', '2024-08-22 13:29:34', '2024-08-22 13:29:34'),
(9, 'Kiona Barber', 'raxal@mailinator.com', 'Tempor eligendi nihi', 'Nulla ut voluptatibu', '2024-08-22 13:29:48', '2024-08-22 13:29:48'),
(10, 'Ruth Rojas', 'xyta@mailinator.com', 'Dolores non placeat', 'Facere consequuntur', '2024-08-22 13:29:58', '2024-08-22 13:29:58'),
(11, 'Fuller Calhoun', 'wyhopy@mailinator.com', 'Magni aut et volupta', 'Est inventore aut la', '2024-08-22 13:30:02', '2024-08-22 13:30:02'),
(12, 'Idola Waters', 'xumutitaq@mailinator.com', 'Ut vel Nam facere la', 'Error nobis anim et', '2024-08-22 13:30:06', '2024-08-22 13:30:06'),
(13, 'Christine Velez', 'xisowo@mailinator.com', 'Dolor dolores et omn', 'Ut magnam possimus', '2024-08-22 13:30:10', '2024-08-22 13:30:10');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `homes`
--

CREATE TABLE `homes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` longtext DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `homes`
--

INSERT INTO `homes` (`id`, `title`, `type`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Welcome to My Blog Site', 'title', 'active', '2024-08-27 17:59:10', '2024-08-20 17:59:10'),
(2, 'We explore the latest trends in Movies, share insightful articles, and provide valuable resources for Audience. Whether you\'re looking for tips, news, or in-depth analysis, you\'ve come to the right place!', 'description', 'active', '2024-08-27 17:59:10', '2024-08-20 17:59:10'),
(3, 'https://inertiajs.com/validation#error-bags', 'facebook', 'active', '2024-08-27 17:59:10', '2024-08-22 12:30:54'),
(4, 'https://www.youtube.com/', 'instagram', 'active', '2024-08-27 17:59:10', '2024-08-22 12:46:52'),
(5, 'https://www.youtube.com/', 'twitter', 'active', '2024-08-27 17:59:10', '2024-08-22 12:46:52'),
(6, 'https://www.youtube.com/', 'threads', 'active', '2024-08-27 17:59:10', '2024-08-22 12:46:52'),
(7, 'We explore the latest trends in Movies, share insightful articles, and provide valuable resources for Audience. Whether you\'re looking for tips, news, or in-depth analysis, you\'ve come to the right place!Stylistically modeled after classic slasher films, the Obscure series puts you in control of various teenagers with unique abilities who must survive a series of supernatural threats. Their Resident Evil-like gameplay was a little outdated even at the time of their release, but few games celebrate the joy of the horror genre quite like these.', 'about', 'active', '2024-08-27 17:59:10', '2024-08-22 12:53:47');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_08_19_212642_add_deleted_at_to_users_table', 2),
(5, '2024_08_20_174529_create_telescope_entries_table', 3),
(7, '2024_08_21_190130_create_blogs_table', 4),
(8, '2024_08_22_175601_create_homes_table', 5),
(9, '2024_08_22_190007_create_contacts_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('b13AX91P52N8cqgNn563e5ngGp5XNuyaWmXjVM0i', 20, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1 Edg/127.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM1Y1Q1RiY0VDZTFiQ0xlT0hCdW95SE4xNlNUQ0Nmd3VtWnJ1SmJOayI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MjA7fQ==', 1724356751),
('IU6fJMIjW6046B2UXcdUWKVjoBrxtcOdsd6QsJnl', 13, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoibUlvZUJxMDc3bGFQZ1paRUxRMWNKSENKdzVwSExONW1mdW53UUZRRSI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjIxOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxMzt9', 1724356685);

-- --------------------------------------------------------

--
-- Table structure for table `telescope_entries`
--

CREATE TABLE `telescope_entries` (
  `sequence` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `batch_id` char(36) NOT NULL,
  `family_hash` varchar(255) DEFAULT NULL,
  `should_display_on_index` tinyint(1) NOT NULL DEFAULT 1,
  `type` varchar(20) NOT NULL,
  `content` longtext NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `telescope_entries_tags`
--

CREATE TABLE `telescope_entries_tags` (
  `entry_uuid` char(36) NOT NULL,
  `tag` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `telescope_monitoring`
--

CREATE TABLE `telescope_monitoring` (
  `tag` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(4, 'Adam', 'vodeqam@mailinator.com', NULL, '$2y$12$1EL/AtCU3XaWJK8YhHKrcu8LAXihDf8Ph90/gh9g0.p.U1Eb8TfBO', NULL, '2024-08-18 06:54:32', '2024-08-22 06:05:12', '2024-08-22 06:05:12'),
(5, 'Lee Henderson', 'dozyfyqaca@mailinator.com', NULL, '$2y$12$5ZstHlJdsswCuckcXRuKnuF5QnnCgfJGtpPB2jorlIyAet65XiIIS', NULL, '2024-08-18 11:02:09', '2024-08-21 11:32:42', '2024-08-21 11:32:42'),
(6, 'Aaron Warren', 'qenixep@mailinator.com', NULL, '$2y$12$fLmiMQQn2Vqxj6PV425ZC.n1yTxQCyt57BxasqU5HHaX127Wxx69K', NULL, '2024-08-18 11:26:43', '2024-08-20 15:21:22', NULL),
(7, 'Rebekah Lynch', 'hefykip@mailinator.com', NULL, '$2y$12$OG7b1vTavuBEytcoHCzn6u8uMIDOGCiXmUV4hh9dBEAhENpyQ1YA.', NULL, '2024-08-18 14:27:15', '2024-08-20 15:21:58', NULL),
(8, 'Mollie Russo', 'tivoxa@mailinator.com', NULL, '$2y$12$aWegO6aNcO9GP..L7RgyqOOcw3L8hYPS/NKitRyNyDv9m0T./YWx2', NULL, '2024-08-18 15:30:07', '2024-08-20 15:22:28', NULL),
(9, 'Leo Burgess', 'qiba@mailinator.com', NULL, '$2y$12$urK6GtUxoYwke8buLuOlq.jWji0XwUHdLLsD0TNfAEgygwtg3aNLq', NULL, '2024-08-18 15:51:17', '2024-08-20 15:23:18', NULL),
(10, 'Alexander Mayer', 'runyhavate@mailinator.com', NULL, '$2y$12$K1WnkmVwgL/IE9lr50/qguRzLU8MaTZCuKgRA2Hglvz8wpF6SeOuW', NULL, '2024-08-18 15:52:26', '2024-08-20 15:23:07', NULL),
(11, 'Lacey Mckee', 'vutyl@mailinator.com', NULL, '$2y$12$kD6jf9tLGDTLt2FuoFtZ6.q9QdyZq1rWrsEOX4KdsY/CTSn/NuS6u', NULL, '2024-08-18 16:35:35', '2024-08-20 15:23:20', NULL),
(12, 'Cynthia Davenport', 'mica@mailinator.com', NULL, '$2y$12$8B/judzac9Z.CZ8wT7RzpOcSIPjKoIiQlXtVITtaWm5Kd5dLgUPQG', NULL, '2024-08-19 06:47:39', '2024-08-19 06:47:39', NULL),
(13, 'Prescott Miller', 'xofiw@mailinator.com', NULL, '$2y$12$KbtQMQ4wIRknX9MGa7OZK.3qGi0C7CNE1LveOeXT2PBtBOm2GVNtO', NULL, '2024-08-19 11:07:27', '2024-08-19 11:07:27', NULL),
(14, 'Erich Johnston', 'sopusecuwo@mailinator.com', NULL, '$2y$12$N5JzRx5S6O1qN.Z6VZfVsuuiJwqGmSMtFmv6Sf0uPItJ50E8k/zIi', NULL, '2024-08-19 14:06:43', '2024-08-19 14:06:43', NULL),
(15, 'Zachery Mcfarland', 'naji@mailinator.com', NULL, '$2y$12$7AvZpeMyj4Umry39Q1y5k.dvNi3/Cbw0oJGNWnPeTmkjEly2l4bfm', NULL, '2024-08-19 15:29:41', '2024-08-19 15:29:41', NULL),
(16, 'Leroy Cabrera', 'lumytuxaq@mailinator.com', NULL, '$2y$12$NoZtBi2FcSfpMarPmKvmv.hcIJHozjuLw8vjnS52JJW00gxx4vbZO', NULL, '2024-08-19 15:41:43', '2024-08-20 15:18:22', NULL),
(17, 'Eliana Rowland', 'titywa@mailinator.com', NULL, '$2y$12$Zx4kNBbr42f.Ytv0jIJ6Wea7O/s94LbSeST1xjhebNzjZ2UP2QMKO', NULL, '2024-08-20 15:03:42', '2024-08-21 11:32:31', '2024-08-21 11:32:31'),
(18, 'Isaiah England', 'jibejotyh@mailinator.com', NULL, '$2y$12$Z5A3AsFzK6K4HTDddnn6lullcGM8I86SzlQesTCJ8tAONQcEUiZRO', NULL, '2024-08-21 12:07:12', '2024-08-21 12:07:12', NULL),
(19, 'Abra Everett', 'samek@mailinator.com', NULL, '$2y$12$ITitV1NO7spKQMp8Ndia.eDr7KpWUin.Nuw8y3jKzBSNOUUEyN/.2', NULL, '2024-08-22 03:01:09', '2024-08-22 03:01:09', NULL),
(20, 'Keely Rodriguez', 'camytuj@mailinator.com', NULL, '$2y$12$rEVtpk.VWLM7ymVV3hnZPeEANcu3kGpbAoAhYHCOtPg9jTZ2OcYO2', NULL, '2024-08-22 13:57:21', '2024-08-22 13:57:21', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blogs_user_id_foreign` (`user_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `homes`
--
ALTER TABLE `homes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `telescope_entries`
--
ALTER TABLE `telescope_entries`
  ADD PRIMARY KEY (`sequence`),
  ADD UNIQUE KEY `telescope_entries_uuid_unique` (`uuid`),
  ADD KEY `telescope_entries_batch_id_index` (`batch_id`),
  ADD KEY `telescope_entries_family_hash_index` (`family_hash`),
  ADD KEY `telescope_entries_created_at_index` (`created_at`),
  ADD KEY `telescope_entries_type_should_display_on_index_index` (`type`,`should_display_on_index`);

--
-- Indexes for table `telescope_entries_tags`
--
ALTER TABLE `telescope_entries_tags`
  ADD PRIMARY KEY (`entry_uuid`,`tag`),
  ADD KEY `telescope_entries_tags_tag_index` (`tag`);

--
-- Indexes for table `telescope_monitoring`
--
ALTER TABLE `telescope_monitoring`
  ADD PRIMARY KEY (`tag`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `homes`
--
ALTER TABLE `homes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `telescope_entries`
--
ALTER TABLE `telescope_entries`
  MODIFY `sequence` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blogs`
--
ALTER TABLE `blogs`
  ADD CONSTRAINT `blogs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `telescope_entries_tags`
--
ALTER TABLE `telescope_entries_tags`
  ADD CONSTRAINT `telescope_entries_tags_entry_uuid_foreign` FOREIGN KEY (`entry_uuid`) REFERENCES `telescope_entries` (`uuid`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
