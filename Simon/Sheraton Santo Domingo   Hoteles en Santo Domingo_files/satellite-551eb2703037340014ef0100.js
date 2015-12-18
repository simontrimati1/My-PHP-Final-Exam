//check if mbox is defined
if (typeof mboxFactoryDefault != 'undefined') {
  s.contextData['PCID'] = mboxFactoryDefault.getPCId().getId();
}
