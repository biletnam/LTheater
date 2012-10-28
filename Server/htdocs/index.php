<?php
session_start();
?>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.2/jquery-ui.min.js"></script>
        <script src="/scripts/script.js"></script>
        <link rel="stylesheet" type="text/css" href="/styles/styles.css" />
        <link rel="stylesheet" type="text/css" href="http://twitter.github.com/bootstrap/1.4.0/bootstrap.min.css">
        <title>LTheater Control Panel</title>
    </head>
    <body>
        <div id="page">
            <div><img src="/img/title.png" /></div>
            <div id="uploader">
                <form action="/scripts/upload.php" method="POST" enctype="multipart/form-data" id="upload">
                    <input type="hidden" name="<?php echo ini_get("session.upload_progress.name"); ?>" value="upload" />
                    <input type="hidden" id=movieID" name="mid" />
                    <fieldset>
                        <div id="uploadtitle"><input type="text" id="movieName" name="search" /></div>
                        <br />
                        <br />
                        <div id="uploadfile">
                            <input type="file" name="movieFile" id="movieFile" class="movieFile" />
                        </div>
                        <div id="uploadprogress">
                            <progress max="1" value="0" id="progress"></progress>
                            <p id="progress-txt"></p>
                        </div>
                        <br />
                        <br />
                        <br />
                        <div class="actions">
                            <input type="submit" class="btn primary" value="Upload"/>
                        </div>
                    </fieldset>
            </div>
            <div id="bittorrenter">
            </div>
        </div>
        <!-- File containing Jquery and the Jquery form plugin-->
        <script src="/scripts/jquery.js"></script>
        <script>
		
            
        </script>
    </body>
</html>