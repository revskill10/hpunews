// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require select2
//= require ckeditor-jquery
//= require_tree .
 $(document).ready(function() {
    $('#test').select2({
        minimumInputLength: 3,
        placeholder: 'Search',
        ajax: {
            url: "/search",
            dataType: 'json',
            quietMillis: 100,
            data: function(term, page) {
                return {                                       
                    term: term,
                    page_limit: 10, // page size
                    page: page // page number
                };
            },
            results: function(data, page ) {
                var more = (page * 10) < data.total;                
                return { results: data.users, more: more }
            }
        },
        formatResult: function(user) { 
            return "<div class='select2-user-result'>" + user.hodem + " " + user.ten + "</div>"; 
        },
        formatSelection: function(user) { 
            return user.hodem + " " + user.ten; 
        },
        initSelection : function (element, callback) {
            var elementText = $(element).attr('data-init-text');
            callback({"term":elementText});
        },
        escapeMarkup: function (m) { return m; } 
    });


 
    $('#test2').select2({
        minimumInputLength: 3,
        placeholder: 'Search',
        ajax: {
            url: "/search",
            dataType: 'json',
            quietMillis: 100,
            data: function(term, page) {
                return {  
                    type: 'ten_khoa_hoc'  ,                                   
                    term: term,
                    page_limit: 10, // page size
                    page: page // page number
                };
            },
            results: function(data, page ) {
                var more = (page * 9) < data.total;                
                return { results: data.ten_khoa_hoc, more: more }
            }
        },
        formatResult: function(khoahoc) { 
            return "<div class='select2-user-result'>" + khoahoc.name + "</div>"; 
        },
        formatSelection: function(khoahoc) { 
            return khoahoc.name; 
        },
        initSelection : function (element, callback) {
            var elementText = $(element).attr('data-init-text');
            callback({"term":elementText});
        },
        escapeMarkup: function (m) { return m; } 
    });
 });