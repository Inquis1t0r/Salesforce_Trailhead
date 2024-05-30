var customer = me.getLuCustomer();
let latitude =0;
let longitude= 0;
if (customer) {
  Latitude=customer.getLatitude();
  longitude=customer.getLongitude();
}
Const url = `http://maps.google.com/maps?mode=d&daddr=${latitude}+${longitude}`;
var promise = Facade.startThirdPartyAsync(url,{});
