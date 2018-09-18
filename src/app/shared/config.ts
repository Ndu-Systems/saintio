export const IS_LOCAL = false;
let api ="http://saintio.ndu-systems.net/api"
let web ="http://saintio.ndu-systems.net"
if(IS_LOCAL){
    api='http://localhost/saintio/api';
    web='http://localhost:4200';
    
}else{

}
export   const API_URL=api;
export const  WEB_HOST = web;

export const EMAIL= "http://demo.ndu-systems.net/api/emailClient2.php";
export const emailbeta = "http://ndu-systems.net/api/email.php"


export function GetImagePath(imageUrl){
return `${API_URL}/Invest/${imageUrl}`;
}
