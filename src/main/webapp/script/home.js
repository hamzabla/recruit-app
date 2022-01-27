$(document).ready(function (){
//    candidate cliks on like
    $(".canLike").click(function (){
        var postId= $(this).attr("id");
        $.ajax({
            url: "addLike",
            type:"post",
            async: false,
            data: {
                postId: postId
            },
            success:function (){
            }
        });
    });
    //    candidate cliks on unlike
    $(".canUnlike").click(function (){
        var likeId= $(this).attr("id");
        var postId= $(this).attr("about");
        $.ajax({
            url: "removeLike",
            type:"post",
            async: false,
            data: {
                likeId: likeId,
                postId: postId
            },
            success:function (){
                console.log("click on unlike of post : "+postId);
            }
        });
    });
    //    recruiter cliks on like
    $(".recLike").click(function (){
        var postId= $(this).attr("id");
        $.ajax({
            url: "addLike",
            type:"post",
            async: false,
            data: {
                postId: postId
            },
            success:function (){}
        });
    });

    //    candidate cliks on unlike
    $(".recUnlike").click(function (){
        var likeId= $(this).attr("id");
        var postId= $(this).attr("about");
        $.ajax({
            url: "removeLike",
            type:"post",
            async: false,
            data: {
                likeId: likeId,
                postId: postId
            },
            success:function (){}
        });
    });
});
var react = false;
function toggleReact() {
    if (react) {
        document.getElementById("view_react").setAttribute("class", "far fa-heart fa-2x")
        react = false;
    } else {
        document.getElementById("view_react").setAttribute("class", "fas fa-heart text-red-600 fa-2x")
        react = true;
    }
}
var shown=false;
function toggleCategories(){
    if(!shown) {
        var categories = document.getElementById("categories");
        categories.classList.remove("hidden");
        shown=true;
    }
    else{
        var categories = document.getElementById("categories");
        categories.classList.add("hidden");
        shown=false;
    }
};
function openModal(){
    var post_modal=document.getElementById("add-post");
    post_modal.classList.remove("hidden");
};
function closeModal(){
    var post_modal=document.getElementById("add-post");
    post_modal.classList.add("hidden");
};