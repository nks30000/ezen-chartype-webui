<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <link href="https://netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>

    <link rel="stylesheet" href="../resource/css/popup.css">
    <link rel="stylesheet" href="../resource/js/popup.js">
    <!------ Include the above in your HEAD tag ---------->
    
    
    <div class="modal img-modal">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="modal-body">
            <div class="row">
              <div class="col-md-8 modal-image">
                <img class="img-responsive " src="https://images.unsplash.com/photo-1485230895905-ec40ba36b9bc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=900&q=60">
                <img class="img-responsive hidden" src="http://upload.wikimedia.org/wikipedia/commons/1/1a/Bachalpseeflowers.jpg" />
                <img class="img-responsive hidden" src="http://www.netflights.com/media/216535/hong%20kong_03_681x298.jpg" />
    
                <a href="" class="img-modal-btn left"><i class="glyphicon glyphicon-chevron-left"></i></a>
                <a href="" class="img-modal-btn right"><i class="glyphicon glyphicon-chevron-right"></i></a>
              </div>
              <div class="col-md-4 modal-meta">
                <div class="modal-meta-top">
                  <button type="button" class="close"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                  <div class="img-poster clearfix">
                    <a href=""><img class="img-circle" src="https://s-media-cache-ak0.pinimg.com/736x/3b/7d/6f/3b7d6f60e2d450b899c322266fc6edfd.jpg"/></a>
                    <strong><a href="">John Doe</a></strong>
                    <span>12 minutes ago</span>
                  </div>
    
                  <ul class="img-comment-list">
                    <li>
                      <div class="comment-img">
                        <img src="http://lorempixel.com/50/50/people/6">
                      </div>
                      <div class="comment-text">
                        <strong><a href="">Jane Doe</a></strong>
                        <p>Hello this is a test comment.</p> <span class="date sub-text">on December 5th, 2016</span>
                      </div>
                    </li>
                    <li>
                      <div class="comment-img">
                        <img src="http://lorempixel.com/50/50/people/7">
                      </div>
                      <div class="comment-text">
                        <strong><a href="">Jane Doe</a></strong>
                        <p>Hello this is a test comment and this comment is particularly very long and it goes on and on and on.</p> <span>on December 5th, 2016</span>
                      </div>
                    </li>
                    <li>
                      <div class="comment-img">
                        <img src="http://lorempixel.com/50/50/people/9">
                      </div>
                      <div class="comment-text">
                        <strong><a href="">Jane Doe</a></strong>
                        <p class="">Hello this is a test comment.</p> <span class="date sub-text">on December 5th, 2016</span>
                      </div>
                    </li>
                  </ul>
                </div>
                <div class="modal-meta-bottom">
                  <input type="text" class="form-control" placeholder="Leave a commment.."/>
                </div>
              </div>
            </div>
          </div>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div>
    
    <p class="text-center text-muted">Updated Dec. 5th 2016 with basic responsive styles</p>
</body>
</html>