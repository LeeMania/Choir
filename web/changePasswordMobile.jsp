<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
        <meta name="apple-mobile-web-app-capable" content="yes" />
        <meta name="apple-mobile-web-app-status-bar-style" content="black" />
        <title>Change Password</title>
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
                <h3>Change password for:<br> ${member.firstName} ${member.lastName}</h3>
            </div>
            <div data-role="content">
                <form action="Controller" method="POST">
                    <div class="table">
                        <div class="row">
                            <div class="cell">
                                Old password:
                            </div>
                            <input type="password" name="oldPass">
                        </div>
                        <div class="row">
                            <div class="cell">
                                New password:
                            </div>
                            <input type="password" name="newPass">
                        </div>
                        <div class="row">
                            <div class="cell">
                                New password again:
                            </div>
                            <input type="password" name="newPassAgain">
                        </div>
                        <div class="row">
                            <div class="cell">

                            </div>
                            <div class="cell">
                                <button type="submit" name="command" value="changePassMob" data-inline="true">Save</button>
                                <button type="submit" name="command" value="backMob" data-inline="true">Cancel</button>
                            </div>
                        </div>
                    </div>
                </form>
                </body>
                </html>
