<?
$api_key = 'b114f3948e012226d6752817379338a7';

// If the request was not issued by AJAX, or
// the search term is missing, exit:

#if(!$_SERVER["HTTP_X_REQUESTED_WITH"] || !$_GET['term']){
#    exit;
#}
include 'TMDb.php';

$tmdb = new TMDb($api_key);

// Send a search API request to TMDb,
// and parse the returned JSON data:
echo $tmdb->searchMovie($_GET['term']);

$json = json_decode($tmdb->searchMovie($_GET['term']));

$response = array();

$i=0;

foreach($json as $movie){

	// Only movies existing in the IMDB catalog (and are not adult) are shown

	if(!$movie->imdb_id || $movie->adult) continue;
	if($i >= 8 ) break;

	// The jQuery autocomplete widget shows the label in the drop down,
	// and adds the value property to the text box.

	$response[$i]['value'] = $movie->name;
	$response[$i]['label'] = $movie->name . ' <small>(' . date('Y',strtotime($movie->released)).')</small>';
	$i++;
}

// Presenting the response as a JSON object:
echo json_encode($response);
?>