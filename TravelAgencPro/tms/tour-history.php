<?php
session_start();
error_reporting(0);
include('includes/config.php');
if(strlen($_SESSION['login'])==0)
	{	
header('location:index.php');
}
else{
if(isset($_REQUEST['bkid']))
	{
		$bid=intval($_GET['bkid']);
$email=$_SESSION['login'];
	$sql ="SELECT FromDate FROM tblbooking WHERE UserEmail=:email and BookingId=:bid";
$query= $dbh -> prepare($sql);
$query-> bindParam(':email', $email, PDO::PARAM_STR);
$query-> bindParam(':bid', $bid, PDO::PARAM_STR);
$query-> execute();
$results = $query -> fetchAll(PDO::FETCH_OBJ);
if($query->rowCount() > 0)
{
foreach($results as $result)
{
	 $fdate=$result->FromDate;

	$a=explode("/",$fdate);
	$val=array_reverse($a);
	 $mydate =implode("/",$val);
	$cdate=date('Y/m/d');
	$date1=date_create("$cdate");
	$date2=date_create("$fdate");
 $diff=date_diff($date1,$date2);
echo $df=$diff->format("%a");
if($df>1)
{
$status=2;
$cancelby='u';
$sql = "UPDATE tblbooking SET status=:status,CancelledBy=:cancelby WHERE UserEmail=:email and BookingId=:bid";
$query = $dbh->prepare($sql);
$query -> bindParam(':status',$status, PDO::PARAM_STR);
$query -> bindParam(':cancelby',$cancelby , PDO::PARAM_STR);
$query-> bindParam(':email',$email, PDO::PARAM_STR);
$query-> bindParam(':bid',$bid, PDO::PARAM_STR);
$query -> execute();

$msg="Booking Cancelled successfully";
}
else
{
$error="You can't cancel booking before 24 hours";
}
}
}
}

?>
<!DOCTYPE HTML>
<html>
<head>
	 <link rel="stylesheet" type="text/css" href="style.css">
    <link rel="stylesheet" href="https://cdn.snipcart.com/themes/v3.3.0/default/snipcart.css" />
    <link rel="preconnect" href="https://app.snipcart.com" />
    <link rel="preconnect" href="https://cdn.snipcart.com" />
<title>FTA - Fast Travel Agency</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Fast Travel Agency In PHP" />
<script type="applijewelleryion/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="css/style.css" rel='stylesheet' type='text/css' />
<link href='//fonts.googleapis.com/css?family=Open+Sans:400,700,600' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Roboto+Condensed:400,700,300' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'>
<link href="css/font-awesome.css" rel="stylesheet">
<!-- Custom Theme files -->
<script src="js/jquery-1.12.0.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<!--animate-->
<link href="css/animate.css" rel="stylesheet" type="text/css" media="all">
<script src="js/wow.min.js"></script>
	<script>
		 new WOW().init();
	</script>

  <style>
		.errorWrap {
    padding: 10px;
    margin: 0 0 20px 0;
    background: #fff;
    border-left: 4px solid #dd3d36;
    -webkit-box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
    box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
}
.succWrap{
    padding: 10px;
    margin: 0 0 20px 0;
    background: #fff;
    border-left: 4px solid #5cb85c;
    -webkit-box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
    box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
}
		</style>
</head>
<body>
<!-- top-header -->
<div class="top-header">
<?php include('includes/header.php');?>
<div class="banner-1 ">
	<div class="container">
		<h1 class="wow zoomIn animated animated" data-wow-delay=".5s" style="visibility: visible; animation-delay: 0.5s; animation-name: zoomIn;">FTA-Fast Travel Agency</h1>
	</div>
</div>
<!--- /banner-1 ---->
<!--- privacy ---->
<div class="privacy">
	<div class="container">
		<h3 class="wow fadeInDown animated animated" data-wow-delay=".5s" style="visibility: visible; animation-delay: 0.5s; animation-name: fadeInDown;">My Tour History</h3>
		<form name="chngpwd" method="post" onSubmit="return valid();">
		 <?php if($error){?><div class="errorWrap"><strong>ERROR</strong>:<?php echo htmlentities($error); ?> </div><?php } 
				else if($msg){?><div class="succWrap"><strong>SUCCESS</strong>:<?php echo htmlentities($msg); ?> </div><?php }?>
	<p>
	<table border="1" width="100%">
<tr align="center">
<th>#</th>
<th>Booking Id</th>
<th>Package Name</th>	
<th>From</th>
<th>To</th>
<th>Comment</th>
<th>Status</th>
<th>Booking Date</th>
<th>Action</th>
</tr>
<?php 

$uemail=$_SESSION['login'];;
$sql = "SELECT tblbooking.BookingId as bookid,tblbooking.PackageId as pkgid,tbltourpackages.PackageName as packagename,tblbooking.FromDate as fromdate,tblbooking.ToDate as todate,tblbooking.Comment as comment,tblbooking.status as status,tblbooking.RegDate as regdate,tblbooking.CancelledBy as cancelby,tblbooking.UpdationDate as upddate from tblbooking join tbltourpackages on tbltourpackages.PackageId=tblbooking.PackageId where UserEmail=:uemail";
$query = $dbh->prepare($sql);
$query -> bindParam(':uemail', $uemail, PDO::PARAM_STR);
$query->execute();
$results=$query->fetchAll(PDO::FETCH_OBJ);
$cnt=1;
if($query->rowCount() > 0)
{
foreach($results as $result)
{	?>
<tr align="center">
<td><?php echo htmlentities($cnt);?></td>
<td>#BK<?php echo htmlentities($result->bookid);?></td>
<td><a href="package-details.php?pkgid=<?php echo htmlentities($result->pkgid);?>"><?php echo htmlentities($result->packagename);?></a></td>
<td><?php echo htmlentities($result->fromdate);?></td>
<td><?php echo htmlentities($result->todate);?></td>
<td><?php echo htmlentities($result->comment);?></td>
<td><?php if($result->status==0)
{
echo "Pending";
}
if($result->status==1)
{
echo "Confirmed";
}
if($result->status==2 and  $result->cancelby=='u')
{
echo "Canceled by you at " .$result->upddate;
} 
if($result->status==2 and $result->cancelby=='a')
{
echo "Canceled by admin at " .$result->upddate;

}
?></td>
<td><?php echo htmlentities($result->regdate);?></td>
<?php if($result->status==2)
{
	?><td>Cancelled</td>
<?php } else {?>
<td><a href="tour-history.php?bkid=<?php echo htmlentities($result->bookid);?>" onclick="return confirm('Do you really want to cancel booking')" >Cancel</a></td>
<?php }?>
</tr>
<?php $cnt=$cnt+1; }} ?>
	</table>
		
			</p>
			</form>

		
	</div>
<!---styling cart --->
<style>
body {margin:25px;}

div.polra{ margin:5px ; border:2px grey; border-radius:7px;

}

div.contra {
  text-align: center;
  padding: 10px 20px;
}
</style>

<!--- End of style-->
    


<!--- SHOPING CART---->

<h3 class="wow fadeInDown animated animated" data-wow-delay=".5s" style="visibility: visible; animation-delay: 0.5s; animation-name: fadeInDown;">Shopping Cart</h3>
		 <?php if($error){?><div class="errorWrap"><strong>ERROR</strong>:<?php echo htmlentities($error); ?> </div><?php } 
				else if($msg){?><div class="succWrap"><strong>SUCCESS</strong>:<?php echo htmlentities($msg); ?> </div><?php }?>



    <header>

        <button class="snipcart-checkout"><svg width="31" height="10%" viewBox="0 0 31 27" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M1.10512 0.368718C0.560256 0.368718 0.118164 0.812066 0.118164 1.35848C0.118164 1.9049 0.560256 2.34824 1.10512 2.34824H4.90887L8.30138 18.4009C8.43503 19.0053 8.83085 19.5079 9.32946 19.5041H25.7788C26.3005 19.5118 26.7799 19.0375 26.7799 18.5143C26.7799 17.9911 26.3006 17.5168 25.7788 17.5245H10.1315L9.71003 15.545H27.095C27.5371 15.5412 27.9547 15.2048 28.0511 14.7718L30.354 4.87412C30.4825 4.29933 29.9852 3.67172 29.3979 3.66786H7.21171L6.6771 1.15221C6.58329 0.71276 6.15921 0.368652 5.7107 0.368652L1.10512 0.368718ZM7.623 5.64746H12.7634L13.2569 8.61674H8.25005L7.623 5.64746ZM14.7785 5.64746H20.9881L20.4946 8.61674H15.2719L14.7785 5.64746ZM23.0031 5.64746H28.1537L27.4649 8.61674H22.5097L23.0031 5.64746ZM8.67181 10.5963H13.5862L14.0797 13.5656H9.29919L8.67181 10.5963ZM15.6009 10.5963H20.1656L19.6721 13.5656H16.0944L15.6009 10.5963ZM22.1807 10.5963H27.0023L26.3135 13.5656H21.6872L22.1807 10.5963ZM12.6197 20.164C10.8141 20.164 9.32979 21.6525 9.32979 23.4632C9.32979 25.2739 10.8141 26.7624 12.6197 26.7624C14.4252 26.7624 15.9095 25.2739 15.9095 23.4632C15.9095 21.6525 14.4252 20.164 12.6197 20.164ZM22.4892 20.164C20.6837 20.164 19.1994 21.6525 19.1994 23.4632C19.1994 25.2739 20.6837 26.7624 22.4892 26.7624C24.2948 26.7624 25.7791 25.2739 25.7791 23.4632C25.7791 21.6525 24.2948 20.164 22.4892 20.164ZM12.6197 22.1435C13.3586 22.1435 13.9356 22.7222 13.9356 23.4632C13.9356 24.2042 13.3586 24.7829 12.6197 24.7829C11.8807 24.7829 11.3037 24.2042 11.3037 23.4632C11.3037 22.7222 11.8807 22.1435 12.6197 22.1435ZM22.4892 22.1435C23.2282 22.1435 23.8052 22.7222 23.8052 23.4632C23.8052 24.2042 23.2282 24.7829 22.4892 24.7829C21.7503 24.7829 21.1733 24.2042 21.1733 23.4632C21.1733 22.7222 21.7503 22.1435 22.4892 22.1435Z" fill="#429bfc"></path></svg>
            <span class="snipcart-total-price" class="snipcart-checkout">$0.00</span>
        </button>
        
    </header>
    <main>
        <h3>Tours</h3>
   
        <div>
            <h3>Nigeria</h3>
            <img src="admin\pacakgeimages\4.1.jpg" class="img-responsive" style="width:10%">
            <p> All the lodging and food for the entire trip is included.
                Trips of any places is with additional cost.</p>
            <div class=buy-button>
                <span class="price"> Per Person CAD $ 3000</span>
                <button class="snipcart-add-item"
                data-item-id="yellow-sticker"
                data-item-price="3000"
                data-item-description="SINGLE/GROUP"
                data-item-image=""
                data-item-name="Nigeria"
                data-item-custom1-options="Single|Group">

                Add to cart
                </button>
            </div>
        </div>
<br>
         <div>
            <h3>Thailand</h3>
            <img src="admin\pacakgeimages\R (1).jpg" class="img-responsive" style="width:10%">
            <p> Ready to experience all that Thailand has to offer, but want to do it a little bit fancy? Thai Experience has got you covered! This 13-day adventure will see you traveling Thailand in style, sleeping in posh hotels, floating bungalows and beachside resorts. From snorkeling around idyllic Phi Phi to making best friends with elephants, this trip really does do it all (and more). Oh, did we mention you’ll be doing all this with a knowledgeable group leader and an instant crew of new mates? The trip of a lifetime just got better.
                13 DAYS OF EPIC ACTIVITIES
                Bangkok River Cruise
                Visit Ancient Temples
                Thai Cooking Class
                Experience Local Life
                Party in Bangkok
                Khao Sok National Park
                Floating Bungalows
                Jungle Treehouse Experience
                Kayaking & Tubing
                Island Tour & Snorkelling
                Beach BBQ
                Muay Thai or Yoga Experience
                Thai Massage
                Beach Party!
                Paradise Islands Boat Trip
                Snorkelling
                Phi Phi Islands Experience
                Phi Phi Viewpoint
                Elephant Sanctuary</p>
            <div class="buy-button">
                <span class="price">Per Person CAD $1749</span>
                <button class="snipcart-add-item"
                data-item-id="Thailand"
                data-item-price="1749"
                data-item-description="Single/Group"
                data-item-image=""
                data-item-name="Thailand"
                >
                Add to cart
                </button>
            </div>
        </div>
<br>
        <div>
            <h3>Nepal</h3>
            <img src="admin\pacakgeimages\R.jpg" class="img-responsive" style="width:10%">
            <p> The capital city of Kathmandu has so much to offer that will leave you spellbound. The sprawling lowland habitats, stupas, and monasteries from the medieval period exuding the historical significance and the hustling and bustling walkways, shops and restaurants will compliment your visit to such a wonderful place. Along with that, the thrills of water rafting, cycling, and spectacles of jungle safari will leave you open-mouthed.Taking a trip to this land that is full of wonders is an experience of a lifetime. Our small group tours in Nepal starts from Kathmandu and lead you through the uncharted avenues of this mythical land. Starting from trekking to Everest base camp, the journey through the forest and a short trip to the landscapes of the ancient hilltop villages, our Nepal vacation packages are customized to make your tour pleasant. Taking care of your travel needs, we ease out your journey with a well-maintained and high-quality fleet of vehicles like cars and buses. These packages are inclusive of your flight and accommodation ticket bookings, so you can immerse in the unmatched beauty of this pristine territory without any hassle. We also keep our clients’ satisfaction on top priority; thus, provide them with timely updates and requirements of this tour. </p>
            <div class="buy-button">
                <span class="price">Per Person CAD $5433</span>
                <button class="snipcart-add-item"
                data-item-id="Nepal"
                data-item-price="5433"
                data-item-description="Group"
                data-item-image=""
                data-item-name="Nepal"
                 
                >
                Add to cart
                </button>
            </div>
        </div>
<br>
        <div>
            <h3>Hawaii</h3>
            <img src="admin\pacakgeimages\A.png" class="img-responsive" style="width:10%">
            <p> This 6 night sample itinerary includes:
            Flight into Hawaii Big Island (Kona) and out of Oahu
            Hotel for 3 nights in Big Island (Kona)
            Flight Big Island (Kona) to Oahu
            Hotel for 3 nights in Oahu
            Hotel Hawaii taxes
            </p>
            <div class="buy-button">
                <span class="price"> Per Person CAD $1899</span>
                <button class="snipcart-add-item"
                data-item-id="Hawaii"
                data-item-price="1899"
                data-item-description="Group"
                data-item-image=""
                data-item-name="Hawaii"
                
                >
                Add to cart
                </button>
            </div>
        </div>
<br>
        <div class="polra" >
        <div>    
            <h3>Bali</h3>
            <img src="admin\pacakgeimages\5.jpg" class="img-responsive" style="width:10%">
            <p> With a stay at Junjungan Ubud Hotel & Spa, you'll be centrally located in Ubud, within a 10-minute drive of Pondok Pekak Library & Learning Centre and Pura Desa. Featured amenities include express check-out, dry cleaning/laundry services, and a 24-hour front desk. A roundtrip airport shuttle is provided for a surcharge (available 24 hours), and free self parking is available onsite.</p>
            
            <div class="buy-button">
                <span class="price"> Per Person CAD $2500</span>
                <button class="snipcart-add-item"
                data-item-id="Bali"
                data-item-price="2500"
                data-item-description="Group|Single"
                data-item-image=""
                data-item-name="Bali"
                
                >
                Add to cart
                </button>
                <br>
            </div>
        </div></div>
        
<Br>
        <div>
            <h3>Banff</h3>
            <img src="admin\pacakgeimages\38.jpg" class="img-responsive" style="width:10%">
            <p> Stop At: Spiral Tunnels, Trans-Canada Highway, Yoho National Park, British Columbia Canada

                It is one of the most bizarre feats of engineering to get the grade of a train line. The current two spiral tunnels where the railroad forms two spirals, crossing beneath itself twice, almost forming a figure eight, before continuing in the proper direction down the mountain.

                Duration: 15 minutes

                Stop At: Takakkaw Falls, Yoho National Park, British Columbia Canada

                Takakkaw Falls is a waterfall located in Yoho National Park, near Field, British Columbia in Canada. The falls have a total height of 373 metres (1,224 ft), making them the second tallest waterfall in Canada. The main drop of the waterfall has a height of 254 metres (833 ft)

                "Takakkaw" translates to "magnificent” in Cree.The falls are fed by the meltwater of the Daly Glacier, which is part of the Waputik Icefield. The glacier keeps the volume of the falls up during the warm summer months, and they are a tourist attraction, particularly in late spring after the heavy snow melts, when the falls are at peak condition. source: wikipedia

                Duration: 45 minutes

                Stop At: Natural Bridge, Yoho National Park, British Columbia Canada

                Sculpted by the erosive forces of rushing water over what had once been a waterfall, the Natural Bridge is a powerful reminder of how much influence water has in shaping the landscape.

                Duration: 30 minutes

                Stop At: Emerald Lake Road, Yoho National Park, British Columbia Canada

                Named by early mountaineering guides because of its extraordinary colour. Glaciers once covered this area and as the ice retreats, their meltwaters pick up a variety of sedimentary materials and carry it downstream to depressions surrounded by glacial debris, creating glacier-water lakes like this. The green or turqoise colour is from the finely ground-up rock flour suspended in the water: the scattering effect which the suspended particles has on the light, combined with the reflection of blue sky, gives the water its remarkable blue-green colour. source: BC geographical name

                Duration: 45 minutes

                Stop At: Lake Louise, Banff National Park, Alberta T0L 1E0 Canada

                Lake Louise is world famous for its turquoise lakes, the Victoria Glacier, soaring mountain backdrop, palatial hotel, and incredible hiking and skiing. Surrounded by a lifetime’s worth of jaw-dropping sights and adventures, Lake Louise is a rare place that must be experienced to be believed.

                Duration: 45 minutes

                Stop At: Moraine Lake Rd off Great Divide Hwy, Lake Louise, Banff National Park, Alberta Canada

                Its waters are the most amazing color, a vivid shade of turquoise that changes in intensity through the summer as the glaciers melt. Set in the rugged Valley of the Ten Peaks, Moraine Lake is surrounded by mountains, waterfalls, and rock piles, creating a scene so stunning it almost seems unreal. Sit lakeside and absorb the sights and pure mountain air, or explore further by canoeing and hiking. It’s an iconically jaw-dropping place that is sure to leave a lasting impression.

                The road to Moraine Lake is closed during the winter due to heavy snowfall and high avalanche risk. Depending on the conditions, the road opens sometime between the third week of May and the first week of June and closes in October after the Canadian Thanksgiving weekend (the second Monday in October).

                Duration: 45 minutes

                Stop At: Banff Avenue, Banff, Banff National Park, Alberta Canada

                Banff is a resort town in the province of Alberta, located within Banff National Park. The peaks of Mt. Rundle and Mt. Cascade, part of the Rocky Mountains, dominate its skyline. On Banff Avenue, the main thoroughfare, boutiques and restaurants mix with château-style hotels and souvenir shops.

                Duration: 1 hour</p>
            <div class="buy-button">
                <span class="price">Per Person CAD $200</span>
                <button class="snipcart-add-item"
                data-item-id="Banff"
                data-item-price="200"
                data-item-description="Single"
                data-item-image=""
                data-item-name="Banff"
                
                >
                Add to cart
                </button>
            </div>
        </div>

    </main>
    <footer>

    </footer>
    <script async src="https://cdn.snipcart.com/themes/v3.3.0/default/snipcart.js">
        <div class="snipcart-item-line__variants"><div><div class="snipcart-item-custom-fields"></div></div>
        <div class="snipcart-item-quantity snipcart-item-line__quantity"><label class="snipcart-item-quantity__label snipcart__font--tiny">Persons</label><div class="snipcart-item-quantity__quantity-price-container"><div class="snipcart-item-quantity__quantity snipcart__font--std"><button aria-label="Decrement quantity" title="Decrement quantity" class="snipcart-button-icon is-small is-secondary"><svg viewBox="0 0 64 64" fill="none" xmlns="http://www.w3.org/2000/svg" alt="" title="" class="snipcart__icon"><path d="M48 31H16v2.462h32V31z" fill="currentColor"></path></svg></button><span class="snipcart__font--secondary snipcart__font--regular">1</span><button aria-label="Increment quantity" title="Increment quantity" class="snipcart-button-icon is-small is-secondary"><svg viewBox="0 0 64 64" fill="none" xmlns="http://www.w3.org/2000/svg" alt="" title="" class="snipcart__icon"><path d="M33.23 30.77H48v2.46H33.23V48h-2.46V33.23H16v-2.46h14.77V16h2.46v14.77z" fill="currentColor"></path></svg></button>
        </div><div class="snipcart-item-quantity__total-price snipcart__font--bold snipcart__font--secondary"> $3,000.00 </div></div></div></div>
    </script>
    <div id="snipcart" data-config-modal-style="side" data-api-key="MGJmMTczYjEtOGRkYy00YzMyLWI2MTUtZmEyMThlNWYyMmIzNjM3MzkzMTc2OTA2OTMzOTc3" hidden></div>


</div>



<!--- /privacy ---->
<!--- footer-top ---->
<!--- /footer-top ---->
<?php include('includes/footer.php');?>
<!-- signup -->
<?php include('includes/signup.php');?>			
<!-- //signu -->
<!-- signin -->
<?php include('includes/signin.php');?>			
<!-- //signin -->
<!-- write us -->
<?php include('includes/write-us.php');?>
</body>
</html>
<?php } ?>