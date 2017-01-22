

function fn_cmn_del(tag,id,tp){
	var cls = $(tag).attr('class')
	cls && cls.indexOf("czxgray")!=-1?layer.msg(tp):___fn_del(tag,id);
}

function fn_graytp(tp){
	layer.msg(tp)
}