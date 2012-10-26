<?
// If the request was not issued by AJAX, or
// the search term is missing, exit:

#if(!$_SERVER["HTTP_X_REQUESTED_WITH"] || !$_GET['term']){
#    exit;
#}
$api = 'b114f3948e012226d6752817379338a7';

$response = array();

$i=0;
$get = str_replace(" ","_",$_GET['term']);
$query = "http://api.themoviedb.org/3/search/movie?api_key=" . $api . "&query=" . $get;
$session = curl_init($query);
curl_setopt($session, CURLOPT_RETURNTRANSFER, true);
$data = curl_exec($session);
curl_close($session);
$json_obj = json_decode($data);
if ($json_obj === NULL) die('Error parsing json');
$movies = $json_obj->id;
foreach($json_obj->{'results'}  as $movie){
	$response[$i]['value'] = $movie->{'title'};
	$response[$i]['label'] = $movie->{'title'}. ' <small>(' . date('Y',strtotime($movie->{'release_date'}).')</small>';
	$i++;
}

// Presenting the response as a JSON object:
echo json_encode($response);
?>