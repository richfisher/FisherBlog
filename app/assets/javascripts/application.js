// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require syntax_highlighter/shCore
//= require syntax_highlighter/shBrushCpp
//= require syntax_highlighter/shBrushRuby
//= require syntax_highlighter/shBrushSql
//= require syntax_highlighter/shBrushBash
//= require syntax_highlighter/shBrushJScript
//= require syntax_highlighter/shBrushXml
//= require syntax_highlighter/shBrushCss
//= require_tree .

SyntaxHighlighter.all();

$(function() {
    $('#search_content').focus(
        function() {
            var val = $(this).val();
            if (val == '搜索') {
                $(this).val('');
            }
        }).blur(function() {
            var val = $(this).val();
            if (val == '') {
                $(this).val('搜索');
            }
        });


    $('#back_to_top').click(function() {
        var bd = document.body;
        bd.scrollTop = 0;
        return false;
    })

    $(window).scroll(function () {
        var bd = document.body
        if (document.body.scrollTop > 100) {
            $('#back_to_top').fadeIn()
        } else {
            $('#back_to_top').fadeOut()
        }
    })
});


