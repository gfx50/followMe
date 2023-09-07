
 var btnCust = '<button type="button" class="btn btn-secondary" title="Add picture tags" ' + 
    'onclick="alert(\'Call your custom code here.\')">' +
    '<i class="bi-tag"></i>' +
    '</button>'; 
$(function(){
$("#avatar-1").fileinput({
    overwriteInitial: true,
    maxFileSize: 0,
    showClose: false,
    showCaption: false,
    browseLabel: '',
    removeLabel: '',
    browseIcon: '<i class="bi-folder2-open"></i>',
    removeIcon: '<i class="bi-x-lg"></i>',
    removeTitle: 'Cancel or reset changes',
    elErrorContainer: '#kv-avatar-errors-1',
    msgErrorClass: 'alert alert-block alert-danger',
    defaultPreviewContent: '<img src="/fm/resources/images/user.png" alt="프로필사진">',
    layoutTemplates: {main2: '{preview} ' +  btnCust + ' {remove} {browse}'},
    allowedFileExtensions: ["jpg", "png", "gif"]
}); //fileinput 
}); // document ready
