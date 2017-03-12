import com.temboo.core.*;
import com.temboo.Library.Twitter.Search.*;

// Create a session using your Temboo account application details
TembooSession session = new TembooSession("accountName", "myFirstApp", "abc123xxxxxxxxxxxxxx");

void setup() {
	// Run the LatestTweet Choreo function
	runLatestTweetChoreo();
}

void runLatestTweetChoreo() {
	// Create the Choreo object using your Temboo session
	LatestTweet latestTweetChoreo = new LatestTweet(session);

	// Set inputs
	latestTweetChoreo.setQuery("yourValueHere");
	latestTweetChoreo.setConsumerKey("yourValueHere");
	latestTweetChoreo.setAccessToken("yourValueHere");
	latestTweetChoreo.setConsumerSecret("yourValueHere");
	latestTweetChoreo.setAccessTokenSecret("yourValueHere");

	// Run the Choreo and store the results
	LatestTweetResultSet latestTweetResults = latestTweetChoreo.run();
	
	// Print results
	println(latestTweetResults.getID());
	println(latestTweetResults.getLimit());
	println(latestTweetResults.getRemaining());
	println(latestTweetResults.getReset());
	println(latestTweetResults.getScreenName());
	println(latestTweetResults.getText());
	println(latestTweetResults.getResponse());

}