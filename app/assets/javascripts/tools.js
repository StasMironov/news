
$( document ).ready(function() {
    var text =  document.querySelectorAll(".microposts-comments__text");
    var content = document.querySelectorAll(".post__content");

    console.log(content);

    for(var i = 0; i <= text.length; i++){
        text =  document.querySelectorAll(".microposts-comments__text")[i].textContent;
        text = text.textContent = text.replace(/[/.<div>!?;]*/g, '');
        document.querySelectorAll(".microposts-comments__text")[i].textContent = text
    }
});


