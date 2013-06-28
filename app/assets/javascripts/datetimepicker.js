$(function() {
  $( "#datetimepicker1" ).datetimepicker({
    dateFormat: 'yy-mm-dd',
    prevText: '이전 달',
    nextText: '다음 달',
    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    dayNames: ['일','월','화','수','목','금','토'],
    dayNamesShort: ['일','월','화','수','목','금','토'],
    dayNamesMin: ['일','월','화','수','목','금','토'],
    showMonthAfterYear: true,
    yearSuffix: '년',
    timeText: '시간',
    hourText: '시',
    minuteText: '분',
    secondText: '초',
    currentText: '지금',
    closeText: '적용',

    timeFormat: "HH:mm",
    minuteGrid: 10,
    hourMin: 10,
    hourMax: 20,
    minDate: new Date(2013, 6, 5, 10, 00),
    maxDate: new Date(2013, 7, 25, 20, 00)
  });

  $( "#datetimepicker2" ).datetimepicker({
    dateFormat: 'yy-mm-dd',
    prevText: '이전 달',
    nextText: '다음 달',
    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    dayNames: ['일','월','화','수','목','금','토'],
    dayNamesShort: ['일','월','화','수','목','금','토'],
    dayNamesMin: ['일','월','화','수','목','금','토'],
    showMonthAfterYear: true,
    yearSuffix: '년',
    timeText: '시간',
    hourText: '시',
    minuteText: '분',
    secondText: '초',
    currentText: '지금',
    closeText: '적용',

    timeFormat: "HH:mm",
    minuteGrid: 10,
    hourMin: 10,
    hourMax: 20,
    minDate: new Date(2013, 6, 5, 10, 00),
    maxDate: new Date(2013, 7, 25, 20, 00)
  });


});
