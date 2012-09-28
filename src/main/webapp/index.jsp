<!DOCTYPE html> 
<html>

<head>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1"> 
   <title>U.S. History in Context</title> 
   <link rel="stylesheet" type="text/css" href="style/bootstrap.css">
   <link rel="stylesheet" type="text/css" href="style/main.css">
   <script src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
   <script src="scripts/jquery.url.js"></script>
   <script type="text/javascript" src="http://appdev.ng.cengage.com/static/steal/steal.js"></script> 
   <!-- MY Javascript -->
   <script type="text/javascript"  src="scripts/searchAndGetResults.js"></script> 


</head> 

<body> 
   <div id="galeContentWrapper" class="history">
      <header>
         <img src="images/logo.png">
         <form name="search" action="" class="form-horizontal">
            <input type="hidden" value="ZXAA-MOD1|ZXACC-MOD1|ZXAL-VRL|ZXAE-VRL|History-US-Misc" name="contentSets" id="contentSets">
            <input type="hidden" value="History-Reference" name="displayGroups" id="displayGroups">
            <label for="search">Locate U.S. History Aritcles</label>
            <div class="input-append">
                   <input id="query" name="query" type="search" class="span4" type="text"><button id="submitSearch" class="btn" type="button">Go!</button>
               </div>
         </form>
      </header>
      <div class="loader">
         <img src="/images/loader.gif" />
      </div>
      <section id="results">

         <ul class="listView"></ul>
      </section>
   </div>
</body>
</html>