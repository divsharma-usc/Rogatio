$(document).ready(function(){
    console.log('hello')
	window.load_more_active=false;
	window.offset=10;
	document.addEventListener('scroll',function(event){
	   bh = document.body.offsetHeight;
       wh = $(window).height();
       scrollY = window.pageYOffset;
	         if(bh - wh -50 < scrollY && !window.load_more_active){
	         	 window.load_more_active=true;
	             $.ajax({
	                  url:'/user',
	                  type:'GET',
	                  dataType:'script',
	                  data:{
	                     offset:window.offset,
	                     format:'js'
	                  }
	             });
	         }
	    
	});
});