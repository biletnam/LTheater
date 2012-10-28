<?php
session_start();
?>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.2/jquery-ui.min.js"></script>
        <script src="/scripts/script.js"></script>
        <link rel="stylesheet" type="text/css" href="/styles/styles.css" />
        <link rel="stylesheet" type="text/css" href="http://twitter.github.com/bootstrap/1.4.0/bootstrap.min.css">
        <title>LTheater Movie Uploader</title>
    </head>
    <body>
        <div id="page">
            <div id="poster"></div><br />
            <div id="holder">
                <form action="/scripts/upload.php" method="POST" enctype="multipart/form-data" id="upload">
                    <input type="hidden" name="<?php echo ini_get("session.upload_progress.name"); ?>" value="upload" />
                    <input type="hidden" id=movieID" name="mid" />
                    <fieldset>
                        Title: <input type="text" id="movieName" name="search" /><br /><br />
                        <table>
                            <tr>
                                <td>
                                    <div class="input">
                                        <input type="file" name="file2" id="file2" />
                                    </div> 
                                </td>
                                <td>
                                    <progress max="1" value="0" id="progress"></progress>
                                    <p id="progress-txt"></p>
                                </td>
                            </tr>
                        </table>
                        <div class="clearfix">
                        </div>
                        <div class="actions">
                            <input type="submit" class="btn primary" value="Upload"/>
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>

        <!-- File containing Jquery and the Jquery form plugin-->
        <script src="/scripts/jquery.js"></script>
        <script>
		
            //Holds the id from set interval
            var interval_id = 0;
        
            $(document).ready(function(){
	
                //jquery form options
                var options = { 
                    success:       stopProgress, //Once the upload completes stop polling the server
                    error:		   stopProgress
                };

                //Add the submit handler to the form
                $('#upload').submit(function(e){
                	
                    //check there is at least one file
                    if($('#file1').val() == '' && $('#file2').val() == '')
                    {
                        e.preventDefault();
                        return;
                    }
		
                    //Poll the server for progress
                    interval_id = setInterval(function() {
                        $.getJSON('/scripts/progress.php', function(data){
                            
                            //if there is some progress then update the status
                            if(data)
                            {
                                $('#progress').val(data.bytes_processed / data.content_length);
                                $('#progress-txt').html('Uploading '+ Math.round((data.bytes_processed / data.content_length)*100) + '%');
                            }
                            
                            //When there is no data the upload is complete
                            else
                            {
                                $('#progress').val('1');
                                $('#progress-txt').html('Complete');
                                stopProgress();
                            }
					
                        })
                    }, 200);
		
                    $('#upload').ajaxSubmit(); 
                    
                    e.preventDefault();
                });	
            });

            function stopProgress()
            {
                clearInterval(interval_id);
            }
        </script>

    </body>
</html>

