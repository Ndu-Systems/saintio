import { Observable } from "rxjs/Observable";
import { Component, OnInit } from "@angular/core";
import { SelectService } from "../../../shared/select.service";
import { IRegister } from "../../students/model/Saint";

@Component({
  selector: "app-all-departement",
  templateUrl: "./all-departement.component.html",
  styleUrls: ["./all-departement.component.css"]
})
export class AllDepartementComponent implements OnInit {
  registerLS$: Observable<Array<IRegister>>;
  status:string = '';
  date:string = '';
  constructor(private selectService: SelectService) {
    this.registerLS$ = this.selectService.select(`user inner join register on user.id = register.userID where register.status <> 'new' order by register.status`);
  }
  ngOnInit() {}
}
