<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
        <meta name="apple-mobile-web-app-capable" content="yes" />
        <meta name="apple-mobile-web-app-status-bar-style" content="black" />
        <title>main</title>
        <link rel="stylesheet" href="https://s3.amazonaws.com/codiqa-cdn/mobile/1.2.0/jquery.mobile-1.2.0.min.css" />
        <link rel="stylesheet" href="my.css" />
        <script src="https://s3.amazonaws.com/codiqa-cdn/jquery-1.7.2.min.js">
        </script>
        <script src="https://s3.amazonaws.com/codiqa-cdn/mobile/1.2.0/jquery.mobile-1.2.0.min.js">
        </script>
        <script src="my.js">
        </script>
        <!-- User-generated css -->
        <style>
        </style>
        <!-- User-generated js -->
        <script>
            try {

                $(function() {

                });

            } catch (error) {
                console.error("Your javascript has an error: " + error);
            }
        </script>
    </head>
    <body>
        <div data-role="page" data-theme="b" id="page1">
            <div data-theme="b" data-role="header">
                <h3>Choir Main</h3>
            </div>
            <div data-role="content">
                <form action="Controller" method="POST">
                    <button type="submit" name="command" value="passwordMob">Change password</button>
                    <button type="submit" name="command" value="memListMob">List members</button>
                </form>
            </div>
            <div data-theme="b" data-role="footer" data-position="fixed">
                <h3>INDSÆT KONTAKT INFO</h3>
            </div>
        </div>
    </body>
</html>
