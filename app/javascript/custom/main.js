$(function(){
  // 3秒後にflashメッセージをfadeout
  $('.notice, .alert').fadeOut(3000);

  // iframe設定
  $('.iframe').modaal({
	type: 'iframe',
});
})
