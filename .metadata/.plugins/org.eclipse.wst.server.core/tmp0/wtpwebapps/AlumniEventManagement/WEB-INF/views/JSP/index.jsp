<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Alumni Event Management</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="<c:url value='/resources/CSS/style.css' />" rel="stylesheet" />
<style>
label {
	font-weight: bold;
}
.checked {
	color: orange;
}
</style>
</head>
<body>
	<div class="container1">
		<div class="help">
			<marquee scrollamount="12" onmouseover="this.stop()"
				onmouseleave="this.start()">
				<div class="contact">
					<h4 style="font-size: 1.2em;">Welcome to Alumni Event
						Management System!</h4>
				</div>
			</marquee>
			<div class="icons">
				<a href="#" class="b1"><i class="fab fa-facebook"></i></a> <a
					href="#" class="b1"><i class="fab fa-twitter"></i></a> <a href="#"
					class="b1"><i class="fab fa-linkedin"></i></a> <a href="#"
					class="b1"><i class="fab fa-instagram"></i></a>
			</div>
		</div>
		<div class="logo-menu-div">
			<div class="logo">
				<label>Alumnihub.org</label>
			</div>
			<div class="menu">
				<ul>
					<li><a href="#">Home</a></li>
					<li><a href="#">About</a></li>
					<li><a href="#">Events</a></li>
					<li><a href="#">Contact</a></li>
					<li><a href="admin">Login</a></li>
				</ul>
			</div>
		</div>
		<div id="carouselExampleIndicators" class="carousel slide slider"
			data-bs-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img
						src="https://img.freepik.com/free-photo/people-having-fun-wedding-hall_1303-19593.jpg?size=626&ext=jpg&ga=GA1.1.2055995809.1724524517&semt=ais_hybrid"
						class="d-block w-100" alt="Event 1">
				</div>
				<div class="carousel-item">
					<img
						src="https://img.freepik.com/premium-photo/cinematic-wide-angle-university-commencement-with-graduate-tossing-cap-amidst-loved-ones_1223049-4744.jpg?size=626&ext=jpg&ga=GA1.1.2055995809.1724524517&semt=ais_hybrid"
						class="d-block w-100" alt="Event 2">
				</div>
				<div class="carousel-item">
					<img
						src="https://img.freepik.com/premium-photo/group-graduates-cap-gown-celebrating-by-tossing-their-caps-air-graduation-ceremony-graduation-ceremony-with-students-cap-gowns-tossing-their-caps-air_538213-109132.jpg?size=626&ext=jpg&ga=GA1.1.2055995809.1724524517&semt=ais_hybrid"
						class="d-block w-100" alt="Event 3">
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
		<div class="box">
			<!-- Upcoming Events -->
			<div class="b1">
				<div class="text-heading">Alumni Reunion</div>
				<div class="img-div">
					<img
						src="https://media.istockphoto.com/id/1371940128/photo/multiracial-friends-taking-big-group-selfie-shot-smiling-at-camera-laughing-young-people.jpg?s=612x612&w=0&k=20&c=FPs-C92zbN6RkHnPG4Fl9zyP2-HZWGy9Prdt46Yn-IY="
						alt="Event">
				</div>
				<div class="info">The event featured engaging speeches from
					distinguished alumni, interactive networking sessions, and a
					nostalgic tour of the campus. Attendees had the opportunity to
					reconnect with old friends, share their experiences, and build new
					connections.We are thrilled to announce that the Alumni Reunion
					will be held again this year.Whether you graduated last year or
					decades ago, We look forward to welcoming you back to campus!</div>
				<center>
					<label>Average Rating:</label> <span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span> <span
						class="fa fa-star checked"></span> <span
						class="fa fa-star checked"></span> <span class="fa fa-star"></span>
				</center>
				<a href="redirect" class="register-button">Register Now</a>
			</div>
			<div class="b1">
				<div class="text-heading">Traditional Event</div>
				<div class="img-div">
					<img
						src="https://img.freepik.com/premium-photo/document-photo-indian-celebrate-diwali-festival_1264014-18252.jpg?size=626&ext=jpg&ga=GA1.1.2055995809.1724524517&semt=ais_hybrid"
						alt="News">
				</div>
				<div class="info">The Traditional Event is one of the most
					anticipated gatherings of the year.The event featured a vibrant
					display of traditional attire and cultural showcases that
					highlighted the diversity of our alumni community.We are excited to
					announce that we will be organizing the Traditional Event again
					this year.Don't miss this opportunity to reconnect with your roots
					and relive the traditions that make our community unique.</div>
				<center>
					<label>Average Rating:</label> <span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span> <span
						class="fa fa-star checked"></span> <span
						class="fa fa-star-half-alt checked"></span> <span
						class="fa fa-star"></span>
				</center>
				<a href="redirect" class="register-button">Register Now</a>
			</div>
			<div class="b1">
				<div class="text-heading">Family Fun Day</div>
				<div class="img-div">
					<img
						src="data:image/jpeg;base64,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"
						alt="Community">
				</div>
				<div class="info">A delightful event designed to bring alumni
					and their families together for a day filled with joy and laughter!
					Enjoy a range of activities, including crafts, and exciting games
					for all ages. Indulge in delicious picnic fare from local food
					trucks and enjoy live entertainment throughout the day. This year,
					we are excited to host Family Fun Day once again.Do not miss out on
					this opportunity to make lasting memories with friends and family!</div>
				<center>
					<label>Average Rating:</label> <span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span> <span
						class="fa fa-star checked"></span> <span
						class="fa fa-star checked"></span> <span
						class="fa fa-star-half-alt checked"></span>
				</center>
				<a href="redirect" class="register-button">Register Now</a>
			</div>
		</div>
		<div class="box">
			<div class="b1">
				<div class="text-heading">Scavenger Hunt</div>
				<div class="img-div">
					<img
						src="https://img.freepik.com/premium-photo/three-girls-are-looking-map-that-says-map_1239658-1682.jpg?size=626&ext=jpg&ga=GA1.1.2055995809.1724524517&semt=ais_hybrid"
						"
						alt="Scavenger">
				</div>
				<div class="info">Get ready for an adventurous day with our
					exciting Scavenger Hunt Event! Alumni and their families will be
					grouped into teams and given a list of clues and tasks to complete
					around the campus. The first team to solve all the clues and reach
					the final destination will win a special prize. We are thrilled to
					announce that the Scavenger Hunt Event is back this year. Gather
					your team, bring your competitive spirit, and join us for a day of
					exploration, fun, and surprises!</div>
				<center>
					<label>Average Rating:</label> <span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span> <span
						class="fa fa-star checked"></span> <span
						class="fa fa-star checked"></span> <span class="fa fa-star"></span>
				</center>
				<a href="redirect" class="register-button">Register Now</a>
			</div>
			<div class="b1">
				<div class="text-heading">Spring Festival</div>
				<div class="img-div">
					<img
						src="https://plus.unsplash.com/premium_photo-1661284892176-fd7713b764a6?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8ZmVzdGl2YWx8ZW58MHx8MHx8fDA%3D"
						alt="Spring">
				</div>
				<div class="info">Welcome spring with open arms at our vibrant
					Spring Festival! Enjoy an array of activities including a flower
					market, craft booths, and live performances. There will be
					interactive workshops for children and adults, as well as a variety
					of delicious food options from local vendors. We are excited to
					bring the Spring Festival back this year. Bring your family for a
					day of fun, creativity, and celebration of the new season!. We are
					looking forward to seeing you there</div>
				<center>
					<label>Average Rating:</label> <span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span> <span
						class="fa fa-star checked"></span> <span
						class="fa fa-star checked"></span> <span
						class="fa fa-star-checked"></span> <span class="fa fa-star"></span>
				</center>
				<a href="redirect" class="register-button">Register Now</a>
			</div>
			<div class="b1">
				<div class="text-heading">Gala Dinner and Awrds Night</div>
				<div class="img-div">
					<img
						src="https://img.freepik.com/premium-photo/examine-influence-industry-politics-gram-generative-ai_1198249-91559.jpg?size=626&ext=jpg&ga=GA1.1.2055995809.1724524517&semt=ais_hybrid"
						alt="awards">
				</div>
				<div class="info">A Step into an evening of elegance and
					celebration at our Gala Dinner & Awards Night. This special event
					honors the remarkable achievements of our alumni, recognizing those
					who have made significant contributions in their fields and to our
					community. This year, we're excited to bring back the Gala Dinner &
					Awards Night,celebrate successes,Do not miss out on this
					opportunity to be part of a night filled with inspiration and
					celebration.</div>
				<center>
					<label>Average Rating:</label> <span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span> <span
						class="fa fa-star-half-alt checked"></span> <span
						class="fa fa-star"></span> <span class="fa fa-star"></span>
				</center>
				<a href="redirect" class="register-button">Register Now</a>
			</div>
		</div>
		<div class="footercon">
			<div class="footer">
				<div class="footer-col">
					<h4>Company</h4>
					<ul>
						<li><a href="#">About Us</a></li>
						<li><a href="#">Our Services</a></li>
						<li><a href="#">Privacy Policy</a></li>
						<li><a href="#">Affiliate Program</a></li>
					</ul>
				</div>
				<div class="footer-col">
					<h4>Get Help</h4>
					<ul>
						<li><a href="#">FAQ</a></li>
						<li><a href="#">Events</a></li>
						<li><a href="#">Feedback</a></li>
						<li><a href="#">Contact</a></li>
					</ul>
				</div>
				<div class="footer-col">
					<h4>Follow Us</h4>
					<div class="social-links">
						<a href="#"><i class="fab fa-facebook-f"></i></a> <a href="#"><i
							class="fab fa-twitter"></i></a> <a href="#"><i
							class="fab fa-instagram"></i></a> <a href="#"><i
							class="fab fa-linkedin-in"></i></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js">	
	</script>
</body>
</html>
</body>
</html>