<?
// If the request was not issued by AJAX, or
// the search term is missing, exit:

#if(!$_SERVER["HTTP_X_REQUESTED_WITH"] || !$_GET['term']){
#    exit;
#}
$api = 'b114f3948e012226d6752817379338a7';
include 'TMDb.php';

// Default English language
$tmdb = new TMDb('b114f3948e012226d6752817379338a7');

// Set-up the class with your own language
$tmdb_nl = new TMDb('API-key', 'nl');

// If you want to load the TMDb-config (default FALSE)
$tmdb_load_config = new TMDb('API-key', 'en', TRUE);

// Send a search API request to TMDb,
// and parse the returned JSON data:

$response = array();

$i=0;

foreach(json_decode(url_exec(curl_init("http://api.themoviedb.org/3/search/movie?api_key=" . $api . "&query=" . $_GET['term'])), TRUE)  as $movie => $val){

	// Only movies existing in the IMDB catalog (and are not adult) are shown

	if(!$movie->imdb_id || $movie->adult) continue;
	if($i >= 8 ) break;

	// The jQuery autocomplete widget shows the label in the drop down,
	// and adds the value property to the text box.

        echo $movie->id;
	$response[$i]['value'] = $movie->name;
	$response[$i]['label'] = $movie->name . ' <small>(' . date('Y',strtotime($movie->released)).')</small>';
	$i++;
}

// Presenting the response as a JSON object:
echo json_encode($response);
?>