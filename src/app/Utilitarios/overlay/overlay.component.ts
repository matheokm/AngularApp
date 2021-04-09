import { Component, OnInit, Input } from '@angular/core';

@Component({
  selector: 'app-overlay',
  templateUrl: './overlay.component.html',
  styleUrls: ['./overlay.component.less']
})
export class OverlayComponent implements OnInit {
  @Input() activeOverlay: string;
  constructor() { }

  ngOnInit(): void {
    let test = this.activeOverlay;
  }

}
