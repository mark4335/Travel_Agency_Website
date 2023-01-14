-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 10, 2022 at 03:53 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `UserName` varchar(100) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `updationDate` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `UserName`, `Password`, `updationDate`) VALUES
(1, 'admin', 'f925916e2754e5e03f75dd58a5733251', '2022-10-29 09:18:49');

-- --------------------------------------------------------

--
-- Table structure for table `tblbooking`
--

CREATE TABLE `tblbooking` (
  `BookingId` int(11) NOT NULL,
  `PackageId` int(11) DEFAULT NULL,
  `UserEmail` varchar(100) DEFAULT NULL,
  `FromDate` varchar(100) DEFAULT NULL,
  `ToDate` varchar(100) DEFAULT NULL,
  `Comment` mediumtext DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT current_timestamp(),
  `status` int(11) DEFAULT NULL,
  `CancelledBy` varchar(5) DEFAULT NULL,
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblenquiry`
--

CREATE TABLE `tblenquiry` (
  `id` int(11) NOT NULL,
  `FullName` varchar(100) DEFAULT NULL,
  `EmailId` varchar(100) DEFAULT NULL,
  `MobileNumber` char(10) DEFAULT NULL,
  `Subject` varchar(100) DEFAULT NULL,
  `Description` mediumtext DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp(),
  `Status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblenquiry`
--

INSERT INTO `tblenquiry` (`id`, `FullName`, `EmailId`, `MobileNumber`, `Subject`, `Description`, `PostingDate`, `Status`) VALUES
(1, 'Anuj kumar', 'anuj@gmail.com', '1111111111', 'Honeymoon', '', '2022-03-03 11:23:53', 1),
(8, 'Ajani Pride', 'AjaniPride@gmail.com', '9999888888', 'Group Package', ' Can i get the details of the package on group of 5 to bali.', '2022-10-09 10:27:00', 1),
(10, 'Hapata Lee', 'HapataLee@test.com', '4543534534', 'Refund processing', 'How long does it take to process the refund? ', '2022-03-15 14:27:00', 1),
(12, 'Ashok Adhikari', 'asf@gmail.com', '5151515151', 'Confirmation Email', 'When will i get the confirmation ticket email', '2022-11-10 16:27:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblissues`
--

CREATE TABLE `tblissues` (
  `id` int(11) NOT NULL,
  `UserEmail` varchar(100) DEFAULT NULL,
  `Issue` varchar(100) DEFAULT NULL,
  `Description` mediumtext DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp(),
  `AdminRemark` mediumtext DEFAULT NULL,
  `AdminremarkDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblissues`
--

INSERT INTO `tblissues` (`id`, `UserEmail`, `Issue`, `Description`, `PostingDate`, `AdminRemark`, `AdminremarkDate`) VALUES
(1, 'anuj@gmail.com', 'Cancellation', 'Girlfriend cheated on me ,Due to the fact that my girlfriend cheated on  ', '2022-05-26 15:03:33', 'Sorry to hear that.
 Hope to see you soon.', '2022-10-27 10:23:53'),
(3, 'sarita@gmail.com', 'Cancellation', 'Something came up', '2022-10-25 17:12:14', 'I have to visit my family instead of trip', '2022-10-28 10:23:53'),
(7, 'AndrewK@gmailm.com', 'Refund', 'Test', '2022-04-14 17:12:14', 'I need the refund on the ticket', '2022-10-02 09:23:53'),
(14, 'AzorNix@gmail.com', 'Refund', 'what is the procedure for the refund?', '2022-10-26 10:23:53', NULL, '2022-01-06 14:03:13');

-- --------------------------------------------------------

--
-- Table structure for table `tblpages`
--

CREATE TABLE `tblpages` (
  `id` int(11) NOT NULL,
  `type` varchar(255) DEFAULT '',
  `detail` longtext DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblpages`
--

INSERT INTO `tblpages` (`id`, `type`, `detail`) VALUES
(1, 'terms', '<P align=justify><FONT size=2><STRONG><FONT color=#990000>(1) ACCEPTANCE OF TERMS</FONT><BR><BR></STRONG>Welcome to Yahoo! India. 1Yahoo Web Services India Private Limited Yahoo\", \"we\" or \"us\" as the case may be) provides the Service (defined below) to you, subject to the following Terms of Service (\"TOS\"), which may be updated by us from time to time without notice to you. You can review the most current version of the TOS at any time at: <A href=\"http://in.docs.yahoo.com/info/terms/\">http://in.docs.yahoo.com/info/terms/</A>. In addition, when using particular Yahoo services or third party services, you and Yahoo shall be subject to any posted guidelines or rules applicable to such services which may be posted from time to time. All such guidelines or rules, which maybe subject to change, are hereby incorporated by reference into the TOS. In most cases the guides and rules are specific to a particular part of the Service and will assist you in applying the TOS to that part, but to the extent of any inconsistency between the TOS and any guide or rule, the TOS will prevail. We may also offer other services from time to time that are governed by different Terms of Services, in which case the TOS do not apply to such other services if and to the extent expressly excluded by such different Terms of Services. Yahoo also may offer other services from time to time that are governed by different Terms of Services. These TOS do not apply to such other services that are governed by different Terms of Service. </FONT></P>\r\n<P align=justify><FONT size=2>Welcome to Yahoo! India. Yahoo Web Services India Private Limited Yahoo\", \"we\" or \"us\" as the case may be) provides the Service (defined below) to you, subject to the following Terms of Service (\"TOS\"), which may be updated by us from time to time without notice to you. You can review the most current version of the TOS at any time at: </FONT><A href=\"http://in.docs.yahoo.com/info/terms/\"><FONT size=2>http://in.docs.yahoo.com/info/terms/</FONT></A><FONT size=2>. In addition, when using particular Yahoo services or third party services, you and Yahoo shall be subject to any posted guidelines or rules applicable to such services which may be posted from time to time. All such guidelines or rules, which maybe subject to change, are hereby incorporated by reference into the TOS. In most cases the guides and rules are specific to a particular part of the Service and will assist you in applying the TOS to that part, but to the extent of any inconsistency between the TOS and any guide or rule, the TOS will prevail. We may also offer other services from time to time that are governed by different Terms of Services, in which case the TOS do not apply to such other services if and to the extent expressly excluded by such different Terms of Services. Yahoo also may offer other services from time to time that are governed by different Terms of Services. These TOS do not apply to such other services that are governed by different Terms of Service. </FONT></P>\r\n<P align=justify><FONT size=2>Welcome to Yahoo! India. Yahoo Web Services India Private Limited Yahoo\", \"we\" or \"us\" as the case may be) provides the Service (defined below) to you, subject to the following Terms of Service (\"TOS\"), which may be updated by us from time to time without notice to you. You can review the most current version of the TOS at any time at: </FONT><A href=\"http://in.docs.yahoo.com/info/terms/\"><FONT size=2>http://in.docs.yahoo.com/info/terms/</FONT></A><FONT size=2>. In addition, when using particular Yahoo services or third party services, you and Yahoo shall be subject to any posted guidelines or rules applicable to such services which may be posted from time to time. All such guidelines or rules, which maybe subject to change, are hereby incorporated by reference into the TOS. In most cases the guides and rules are specific to a particular part of the Service and will assist you in applying the TOS to that part, but to the extent of any inconsistency between the TOS and any guide or rule, the TOS will prevail. We may also offer other services from time to time that are governed by different Terms of Services, in which case the TOS do not apply to such other services if and to the extent expressly excluded by such different Terms of Services. Yahoo also may offer other services from time to time that are governed by different Terms of Services. These TOS do not apply to such other services that are governed by different Terms of Service. </FONT></P>'),
(2, 'privacy', '<span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat</span>'),
(3, 'aboutus', '										<span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Test test</span>'),
(11, 'contact', '										<span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Address------Test</span>');

-- --------------------------------------------------------

--
-- Table structure for table `tbltourpackages`
--

CREATE TABLE `tbltourpackages` (
  `PackageId` int(11) NOT NULL,
  `PackageName` varchar(200) DEFAULT NULL,
  `PackageType` varchar(150) DEFAULT NULL,
  `PackageLocation` varchar(100) DEFAULT NULL,
  `PackagePrice` int(11) DEFAULT NULL,
  `PackageFetures` varchar(255) DEFAULT NULL,
  `PackageDetails` mediumtext DEFAULT NULL,
  `PackageImage` varchar(100) DEFAULT NULL,
  `Creationdate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbltourpackages`
--

INSERT INTO `tbltourpackages` (`PackageId`, `PackageName`, `PackageType`, `PackageLocation`, `PackagePrice`, `PackageFetures`, `PackageDetails`, `PackageImage`, `Creationdate`, `UpdationDate`) VALUES
(1, 'Banff', 'Single', 'Banff/Canmore', 200, 'Air Conditioning Room, Cable / Satellite / Breakfast included', 'Stop At: Spiral Tunnels, Trans-Canada Highway, Yoho National Park, British Columbia CanadaIt is one of the most bizarre feats of engineering to get the grade of a train line. The current two spiral tunnels where the railroad forms two spirals, crossing beneath itself twice, almost forming a figure eight, before continuing in the proper direction down the mountain.\r\n\r\nDuration: 15 minutes\r\n\r\nStop At: Takakkaw Falls, Yoho National Park, British Columbia Canada\r\n\r\nTakakkaw Falls is a waterfall located in Yoho National Park, near Field, British Columbia in Canada. The falls have a total height of 373 metres (1,224 ft), making them the second tallest waterfall in Canada. The main drop of the waterfall has a height of 254 metres (833 ft)\r\n\r\n\"Takakkaw\" translates to \"magnificent” in Cree.The falls are fed by the meltwater of the Daly Glacier, which is part of the Waputik Icefield. The glacier keeps the volume of the falls up during the warm summer months, and they are a tourist attraction, particularly in late spring after the heavy snow melts, when the falls are at peak condition. source: wikipedia\r\n\r\nDuration: 45 minutes\r\n\r\nStop At: Natural Bridge, Yoho National Park, British Columbia Canada\r\n\r\nSculpted by the erosive forces of rushing water over what had once been a waterfall, the Natural Bridge is a powerful reminder of how much influence water has in shaping the landscape.\r\n\r\nDuration: 30 minutes\r\n\r\nStop At: Emerald Lake Road, Yoho National Park, British Columbia Canada\r\n\r\nNamed by early mountaineering guides because of its extraordinary colour. Glaciers once covered this area and as the ice retreats, their meltwaters pick up a variety of sedimentary materials and carry it downstream to depressions surrounded by glacial debris, creating glacier-water lakes like this. The green or turqoise colour is from the finely ground-up rock flour suspended in the water: the scattering effect which the suspended particles has on the light, combined with the reflection of blue sky, gives the water its remarkable blue-green colour. source: BC geographical name\r\n\r\nDuration: 45 minutes\r\n\r\nStop At: Lake Louise, Banff National Park, Alberta T0L 1E0 Canada\r\n\r\nLake Louise is world famous for its turquoise lakes, the Victoria Glacier, soaring mountain backdrop, palatial hotel, and incredible hiking and skiing. Surrounded by a lifetime’s worth of jaw-dropping sights and adventures, Lake Louise is a rare place that must be experienced to be believed.\r\n\r\nDuration: 45 minutes\r\n\r\nStop At: Moraine Lake Rd off Great Divide Hwy, Lake Louise, Banff National Park, Alberta Canada\r\n\r\nIts waters are the most amazing color, a vivid shade of turquoise that changes in intensity through the summer as the glaciers melt. Set in the rugged Valley of the Ten Peaks, Moraine Lake is surrounded by mountains, waterfalls, and rock piles, creating a scene so stunning it almost seems unreal. Sit lakeside and absorb the sights and pure mountain air, or explore further by canoeing and hiking. It’s an iconically jaw-dropping place that is sure to leave a lasting impression.\r\n\r\nThe road to Moraine Lake is closed during the winter due to heavy snowfall and high avalanche risk. Depending on the conditions, the road opens sometime between the third week of May and the first week of June and closes in October after the Canadian Thanksgiving weekend (the second Monday in October).\r\n\r\nDuration: 45 minutes\r\n\r\nStop At: Banff Avenue, Banff, Banff National Park, Alberta Canada\r\n\r\nBanff is a resort town in the province of Alberta, located within Banff National Park. The peaks of Mt. Rundle and Mt. Cascade, part of the Rocky Mountains, dominate its skyline. On Banff Avenue, the main thoroughfare, boutiques and restaurants mix with château-style hotels and souvenir shops.\r\n\r\nDuration: 1 hour', '38.jpeg', '2022-10-21 20:23:44', '2022-10-30 23:51:01'),
(2, 'Nepal ', 'Group', 'Kathmandu/Pokhara', 5433, '\"2 Nights Kathmandu, 2 Nights Pokhara. All-inclusive tour package with sightseeing, hotels, meals and transportation included. ', '  The capital city of Kathmandu has so much to offer that will leave you spellbound. The sprawling lowland habitats, stupas, and monasteries from the medieval period exuding the historical significance and the hustling and bustling walkways, shops and restaurants will compliment your visit to such a wonderful place. Along with that, the thrills of water rafting, cycling, and spectacles of jungle safari will leave you open-mouthed.\r\nTaking a trip to this land that is full of wonders is an experience of a lifetime. Our small group tours in Nepal starts from Kathmandu and lead you through the uncharted avenues of this mythical land. Starting from trekking to Everest base camp, the journey through the forest and a short trip to the landscapes of the ancient hilltop villages, our Nepal vacation packages are customized to make your tour pleasant. Taking care of your travel needs, we ease out your journey with a well-maintained and high-quality fleet of vehicles like cars and buses. These packages are inclusive of your flight and accommodation ticket bookings, so you can immerse in the unmatched beauty of this pristine territory without any hassle. We also keep our clients’ satisfaction on top priority; thus, provide them with timely updates and requirements of this tour. ', 'R.jpg', '2022-07-03 21:24:26', '2022-05-06 23:51:57'),
(3, 'Nigeria', 'Single/Group', 'Lagos', 3000, 'Air Conditioning Room, Cable / Satellite.', 'All the lodging and food for the entire trip is included.Trips of any places is with additional cost.', '4.jpg', '2022-05-13 22:00:58', '2022-02-21 03:12:41'),
(4, 'Thailand', 'Single/Group', 'Bankok-Phuket', 1749, 'Discover ancient temples & crazy nights out, experience Muay Thai or yoga, soak up the sun on the stunning Phi Phi Islands & more!', 'Ready to experience all that Thailand has to offer, but want to do it a little bit fancy? Thai Experience has got you covered! This 13-day adventure will see you traveling Thailand in style, sleeping in posh hotels, floating bungalows and beachside resorts. From snorkeling around idyllic Phi Phi to making best friends with elephants, this trip really does do it all (and more). Oh, did we mention you’ll be doing all this with a knowledgeable group leader and an instant crew of new mates? The trip of a lifetime just got better.\r\n13 DAYS OF EPIC ACTIVITIES\r\nBangkok River Cruise\r\n Visit Ancient Temples\r\n Thai Cooking Class\r\n Experience Local Life\r\n Party in Bangkok\r\n Khao Sok National Park\r\n Floating Bungalows\r\n Jungle Treehouse Experience\r\n Kayaking & Tubing\r\n Island Tour & Snorkelling\r\n Beach BBQ\r\n Muay Thai or Yoga Experience\r\n Thai Massage\r\n Beach Party!\r\n Paradise Islands Boat Trip\r\n Snorkelling\r\n Phi Phi Islands Experience\r\n Phi Phi Viewpoint\r\n Elephant Sanctuary', 'R (1).jpg', '2022-10-15 20:23:44', '2022-10-20 20:23:44'),
(5, 'Bali', 'Single/Group', 'Bali,Indonesia', 2500, 'private room with all the hotel’s amenities,including Wi-Fi and Parking for free', 'With a stay at Junjungan Ubud Hotel & Spa, you will be centrally located in Ubud, within a 10-minute drive of Pondok Pekak Library & Learning Centre and Pura Desa.\r\nFeatured amenities include express check-out, dry cleaning/laundry services, and a 24-hour front desk. A roundtrip airport shuttle is provided for a surcharge \r\n(available 24 hours), and free self parking is available onsite.', '5.jpg', '2022-10-25 20:23:44', '2022-11-14 19:03:44'),
(6, 'Hawaii', 'Single/Group', 'Hawaii,United States', 1899, 'Free Wifi, Airport pickup/dropoff, breakfast included ', 'This 6 night sample itinerary includes: Flight into Hawaii Big Island (Kona) and out of OahuHotel for 3 nights in Big Island \r\n (Kona)Flight Big Island (Kona) to OahuHotel for 3 nights in OahuHotel Hawaii taxes', '5.jpg', '2022-10-25 20:23:44', '2022-10-28 20:23:44');

-- --------------------------------------------------------

--
-- Table structure for table `tblusers`
--

CREATE TABLE `tblusers` (
  `id` int(11) NOT NULL,
  `FullName` varchar(100) DEFAULT NULL,
  `MobileNumber` char(10) DEFAULT NULL,
  `EmailId` varchar(70) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblusers`
--

INSERT INTO `tblusers` (`id`, `FullName`, `MobileNumber`, `EmailId`, `Password`, `RegDate`, `UpdationDate`) VALUES
(1, 'Anuj kumar', '1111111111', 'anuj@gmail.com', 'f925916e2754e5e03f75dd58a5733251', '2022-05-10 10:38:17', '2022-07-20 20:18:18'),
(3, 'Sarita Chaney', '9999999999', 'sarita@gmail.com', '5c428d8875d2948607f3e3fe134d71b4', '2022-05-10 10:50:48', '2022-05-14 07:40:19'),
(7, 'Andrew Ket', '7676767676', 'test@gm.com', 'f925916e2754e5e03f75dd58a5733251', '2022-05-10 10:54:56', '0000-00-00 00:00:00'),
(8, 'Ajani Pride', '9999999999', 'demo@gmail.com', 'f925916e2754e5e03f75dd58a5733251', '2022-05-14 07:17:44', '0000-00-00 00:00:00'),
(9, 'Mishra Odominaria', '3333333333', 'xyz@gmail.com', 'f925916e2754e5e03f75dd58a5733251', '2022-05-14 07:25:13', '2022-05-14 07:25:42'),
(10, 'Hapata Lee', '4543534534', 'demo@test.com', 'f925916e2754e5e03f75dd58a5733251', '2022-05-14 07:43:23', '2022-05-14 07:46:57'),
(11, 'John Nehad', '8888888888', 'JOhnabc@gmail.com', 'f925916e2754e5e03f75dd58a5733251', '2022-05-14 07:54:32', '2022-05-14 07:55:17'),
(12, 'Ashok Adhikari', '5151515151', 'asf@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '2022-10-30 22:06:42', NULL),
(13, 'Mark Wark', '5875661234', 'mwakko@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '2022-10-31 15:56:44', NULL),
(14, 'Azor Nix ', '123456789', 'ash1234@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '2022-11-04 17:21:28', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblbooking`
--
ALTER TABLE `tblbooking`
  ADD PRIMARY KEY (`BookingId`);

--
-- Indexes for table `tblenquiry`
--
ALTER TABLE `tblenquiry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblissues`
--
ALTER TABLE `tblissues`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblpages`
--
ALTER TABLE `tblpages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbltourpackages`
--
ALTER TABLE `tbltourpackages`
  ADD PRIMARY KEY (`PackageId`);

--
-- Indexes for table `tblusers`
--
ALTER TABLE `tblusers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `EmailId` (`EmailId`),
  ADD KEY `EmailId_2` (`EmailId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblbooking`
--
ALTER TABLE `tblbooking`
  MODIFY `BookingId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tblenquiry`
--
ALTER TABLE `tblenquiry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tblissues`
--
ALTER TABLE `tblissues`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tblpages`
--
ALTER TABLE `tblpages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tbltourpackages`
--
ALTER TABLE `tbltourpackages`
  MODIFY `PackageId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tblusers`
--
ALTER TABLE `tblusers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
