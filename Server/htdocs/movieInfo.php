<?
// If the request was not issued by AJAX, or
// the search term is missing, exit:

#if(!$_SERVER["HTTP_X_REQUESTED_WITH"] || !$_GET['term']){
#    exit;
#}
$api = 'b114f3948e012226d6752817379338a7';

$response = array();

$i=0;
$query = "http://api.themoviedb.org/3/search/movie?api_key=" . $api . "&query=" . $_GET['term'];
$session = curl_init($query);
curl_setopt($session, CURLOPT_RETURNTRANSFER, true);
$data = curl_exec($session);
curl_close($session);
$json_obj = json_decode($data, TRUE);
if ($json_obj === NULL) die('Error parsing json');
$movies = $json_obj->id;
print $data;
echo "<br /><br />" . $json_obj . "<br /><br />";
echo var_dump($json_obj->{'results'});
foreach($data  as $movie => $val){

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