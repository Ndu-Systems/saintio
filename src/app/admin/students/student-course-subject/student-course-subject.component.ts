import { SelectService } from './../../../shared/select.service';
import { Observable } from 'rxjs/Observable';
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { StudentCourseSubjectService } from './student-course-subject.service';
import { StudentService } from '../student-list/student.service';
import { ISaintDetails } from '../model/Saint';


@Component({
  selector: 'app-student-course-subject',
  templateUrl: './student-course-subject.component.html',
  styleUrls: ['./student-course-subject.component.css']
})
export class StudentCourseSubjectComponent implements OnInit {
  saint$:Observable<ISaintDetails>;
  userID: number;
  subject: any
  constructor( 
    private studentService:StudentService,
    private selectService: SelectService,
    private studentCourseSubjectService: StudentCourseSubjectService,
    private route: ActivatedRoute) { 
    }

  ngOnInit() {
    this.userID = parseInt(this.route.snapshot.paramMap.get("id"));
     this.getUserInfo(this.userID); // all screen data
  }
  getUserInfo(studentId: number){   
    this.saint$ = this.studentCourseSubjectService.select(studentId);
  }
 
}
