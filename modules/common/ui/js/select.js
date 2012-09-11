function getItemFromSelect(_SenderSelect, _dstSelect)
{
    var itemNo = _SenderSelect.selectedIndex;
    document.getElementById(_dstSelect).selectedIndex=itemNo;
}