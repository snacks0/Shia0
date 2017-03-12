import com.temboo.core.*;
import com.temboo.Library.Twitter.Search.*;
import com.temboo.Library.Tumblr.Post.*;

// Create a session using your Temboo account application details
TembooSession session = new TembooSession("snacks1", "myFirstApp", "M0H4ec6BNq30CgtCXsnjr7avAZBASBvl");

// The name of your Temboo Twitter Profile 
String twitterProfile = "snacks";   //the created app name

// Declare font and text strings
PFont fontTweet, fontInstructions;
String searchText, tweetText, instructionText;

// Create a JSON object to store the search results
JSONObject searchResults;

void setup() {
  size(900, 200);

  // Set up font
  fontTweet = createFont("Helvetica", 20);
  fontInstructions = createFont("Helvetica", 15);

  // Set a search term and instructions
  searchText = "#hewillnotdivideus";
  instructionText = "Type any key for the next one (auto uploads to Tumblr).";


runCreateQuotePostChoreo();
  // Display initial tweet
  runLatestTweetChoreo(); // Run the Tweets Choreo function
  getLatestTweetFromJSON(); // Parse the JSON response
  displayText(); // Display the response
}

void runLatestTweetChoreo() {
  // Create the Choreo object using your Temboo session
  LatestTweet latestTweetChoreo = new LatestTweet(session);



  latestTweetChoreo.setCredential(twitterProfile);

  // Set inputs
  latestTweetChoreo.setQuery("hewillnotdivideus");
  latestTweetChoreo.setConsumerKey("SQ90txCdmyxNAFPiAHBLYSt69");
  latestTweetChoreo.setAccessToken("2526309410-r7dlFlYfHoVxZioYk2gnlCB1305yfakBHA3m2xy");
  latestTweetChoreo.setConsumerSecret("qebmBrgbgqd5pjOoNHJ9jFQwxoHuG6JW7d2woxS26PUlvAjPzO");
  latestTweetChoreo.setAccessTokenSecret("nlH0LUxisHTfKlMabvvHztARrhsvypdd0Q6WIjGBFeIWY");

  // Run the Choreo and store the results
  LatestTweetResultSet latestTweetResults = latestTweetChoreo.run();
  
   // Store results in a JSON object
  searchResults = parseJSONObject(latestTweetResults.getResponse());
}
  void getLatestTweetFromJSON() {
  JSONArray statuses = searchResults.getJSONArray("statuses"); // Create a JSON array of the Twitter statuses in the object
  JSONObject tweet = statuses.getJSONObject(0); // Grab the first tweet and put it in a JSON object
  tweetText = tweet.getString("text"); // Pull the tweet text from tweet JSON object

}
void runCreateQuotePostChoreo() {
  // Create the Choreo object using your Temboo session
  CreateQuotePost createQuotePostChoreo = new CreateQuotePost(session);

  // Set credential
  createQuotePostChoreo.setCredential("hewillnotdivideus");

  // Set inputs

  // Run the Choreo and store the results
  CreateQuotePostResultSet createQuotePostResults = createQuotePostChoreo.run();
  
  // Print results
  println("Posted to Tumblr");

}
void displayText() {
  println(tweetText); // Print tweet to console

  int margin = 30; // Set margins for text box 
  background(255); // Clear background

  // Display tweet
  fill(0); // Set font color
  textFont(fontTweet); // Set tweet font
  text(tweetText, margin, margin, width-margin*3, height-margin*3); // Display tweet text box

  // Display instructions
  fill(#C6DEFF); // Set instruction box color
  rect(0, height-margin*2, width, margin*2); // Draw instruction box rectangle
  fill(0); // Set font color
  textFont(fontInstructions); // Set instructions font
  text(instructionText, margin, height-margin); // Display instructions text
}