import { Component, OnInit } from '@angular/core';

import { StudentService } from '../student-list/student.service';
import { Router } from '@angular/router';
import { AddService } from '../../../shared/services/add.service';
import { SelectService } from '../../../shared/select.service';
import { LoadScreen, StopLoadingScreen } from '../../../shared/loading/load';
import { Message } from 'primeng/components/common/message';

@Component({
  selector: 'app-add-student',
  templateUrl: './add-student.component.html',
  styleUrls: ['./add-student.component.css']
})
export class AddStudentComponent implements OnInit {
  msgs: Message[] = [];

  message: string;
  cell: any;
  password: string;
  address: string;
  email: string;
  surname: string;
  name: string;
  course: any;
  title: any;
  agegroup: any;
  acuptation: any;
  meritalStatus: any;
  dateJoined: any;
  constructor(private addService:AddService, private selectService:SelectService, private studentService:StudentService, private router:Router) { }

  ngOnInit() {
  }
  showSuccess() {
    this.msgs = [];
    this.msgs.push({severity:'success', summary:'Success Message', detail:'Saint added succesfuly'});
}
  AddStudent(course) {
    if(!this.title){
      this.message ="Select title";
      return false;
    }
    if(!this.agegroup){
      this.message ="Select age group";
      return false;
    }
    if(!this.name){
      this.message ="Enter  name";
      return false;
    }
    if(!this.surname){
      this.message ="Enter  surname";
      return false;
    }
    if(!this.email){
      this.message ="Enter email";
      return false;
    }
    if(!this.acuptation){
      this.message ="Enter acuptation";
      return false;
    }
    if(!this.address){
      this.message ="Enter  address";
      return false;
    }
    if(!this.meritalStatus){
      this.message ="Select merital Status";
      return false;
    }
    if(!this.cell){
      this.message ="Enter student cell";
      return false;
    }
    if(!this.dateJoined){
      this.message ="Enter date Joined";
      return false;
    }
 
   
    let data = {
      name: this.name,
      surname: this.surname,
      address: this.address,
      role: 'saint',
      title: this.title,
      agegroup: this.agegroup,
      meritalStatus: this.meritalStatus,
      acuptation: this.acuptation,
      cell: this.cell,
      email: this.email,
      dateJoined: this.dateJoined
    }
    LoadScreen();
    this.addService.add(data, 'student/add')
      .subscribe((response) => {
        StopLoadingScreen();
        this.showSuccess();
       setTimeout(()=>{
        this.router.navigate(['/saints-list']);
       },3000);
      });
  }

} 
