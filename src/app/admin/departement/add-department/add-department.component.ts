import { Router } from '@angular/router';
import { Component, OnInit } from '@angular/core';
import { AddService } from '../../../shared/services/add.service';
import { StopLoadingScreen, LoadScreen } from '../../../shared/loading/load';
import { Observable } from 'rxjs/Observable';
import { SelectService } from '../../../shared/select.service';
import { Message } from 'primeng/components/common/message';

@Component({
  selector: 'app-add-department',
  templateUrl: './add-department.component.html',
  styleUrls: ['./add-department.component.css']
})
export class AddDepartmentComponent implements OnInit {
  msgs: Message[] = [];
  display: boolean = false;

  status: string = "active";
  error: string;
  name: any;
  students$: Observable<any[]>;
  date: string;
  reason: string;
  message: string;
  saintID: number;
  constructor(private selectService: SelectService, private router: Router, private addService: AddService) {
   this.getSaints();
  }
getSaints(){
  this.students$ = this.selectService.select2(`SELECT user.id, user.name, user.role,user.title, user.surname, register.status, register.date FROM user LEFT JOIN register on user.id = register.userID
  `);
}
  ngOnInit() {
  }
  showSuccess() {
    this.msgs = [];
    this.msgs.push({ severity: 'success', summary: 'Success Message', detail: 'Saint added succesfuly' });
  }
  showWarning(text) {
    this.msgs = [];
    this.msgs.push({ severity: 'error', summary: 'Error', detail: text });
  }
  markReg(saintID: number, status) {
    this.message = undefined;
    this.saintID = saintID;
    this.status = status;
    let valid: boolean = false;
    if (!this.date) {
      this.message = "Select Date";
      this.showWarning(this.message)
      valid = false;
      return valid;
    }
    if (status === 'p') {
      valid = true;
    }
    if(status==='a'){
      this.display = true;
      valid = false;

    }
    if (valid) {
   this.save();
    }
  }
  save() {
    let data = {
      date: this.date,
      userID: Number(this.saintID),
      reason: this.reason?this.reason:'na',
      status: this.status
    }
    LoadScreen();
    this.addService.add(data, "register/add")
      .subscribe((response) => {
        this.display = false;
        this.reason = undefined;
        StopLoadingScreen();
        this.getSaints();
        this.router.navigate(['/mark-register']);
      });

  }
}
