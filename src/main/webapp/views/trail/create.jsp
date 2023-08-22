<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ include file="../common/head.jsp" %> --%>
<!DOCTYPE html>
<html lang="ko" data-bs-theme="auto">
<head>
	
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="">
		<title>FollowMe! Trail Sharing SNS</title>
	
	
	
	<link href="/fm/resources/css/fm.css" rel="stylesheet">
<!-- 	<script src="/fm/resources/js/jquery-3.7.0.min.js"></script> -->
	<script src="/fm/resources/js/fm.js"></script>

<style>
.checkbox {
  position: relative; 
  margin: 0;
  
  i {
    background: #eee;
    border: 1px solid #ddd;
    border-radius: 2px;
    cursor: pointer;
    height: 18px;
    width: 18px;
    left: 0;
    position: absolute;
    top: 0;
    
    
    &:after {
      background: transparent;
      border: 2px solid #333;
      border-right: none;
      border-top: none;
      content: '';
      height: 5px;
      width: 11px;
      opacity:.25;
      position:absolute;
      left: 3px;
      top: 5px;
      transform: rotate(-45deg);
      transition:opacity 100ms ease-in;
      
    }
    :hover:after {
      opacity: .5;
    }
  }
  
  input[type=checkbox] {
    visibility: hidden;
    &:checked + i:after {
      opacity: 1;
    }    
  }
}

.thumbnail {
  position: relative;
  
  &.selected {
    border-color: rgba(82,168,236,.8);
    box-shadow: 0 0 8px rgba(82,168,236,.6);
  }
  
  .checkbox {
    position: absolute;
    top: 10px;
    left: 10px;
  }
  .tag {
    position: absolute;
    top: 10px;
    left: -7px;
    max-width: 80%;
    padding: 2px 5px;
    font-size: 10px;
    letter-spacing: 1px;
    text-shadow: 0 -1px 0 rgba(0,0,0,0.3);
    box-shadow: inset 0px 1px 0px rgba(255,255,255,.3), inset 0px 0px 20px rgba(0,0,0,0.1), 0px 1px 1px rgba(0,0,0,0.65);
    background: linear-gradient(to top, rgba(38,38,38,.7) 0, rgba(121,121,121,.7) 100%);
    display: inline-block;
    
    &:before {
      content: '';
      position: absolute;
      bottom: -7px;
      left: 0;
      display: block;
      border-width: 7px 0 0 7px;
      border-style: solid;
      border-color: rgba(55, 55, 55, 0.87) rgba(0, 0, 0, 0) rgba(0, 0, 0, 0) rgba(0, 0, 0, 0);
      z-index: -1;
    }
    
    &--empty {
      box-shadow: inset 0px 1px 0px rgba(255,255,255,.3), inset 0px 0px 20px rgba(0,0,0,0.1), 0px 1px 1px rgba(100, 3, 3, 0.65);
      background: linear-gradient(to top, rgba(178, 31, 35, 0.91) 0, rgba(226, 19, 24, 0.76) 100%);
      
      &:before {
        border-color: rgba(113, 2, 5, 0.83) rgba(0, 0, 0, 0) rgba(0, 0, 0, 0) rgba(0, 0, 0, 0);
      }
    }
    
    &__text {
      color: #fff;
      text-decoration: none;
    }    
  }
}

.photo-section h2 small {
  font-size: 50%;
}
.photo__remove {
  background: rgba(209, 12, 12, 0.7);
  box-shadow: inset 0 0 1px rgba(255, 255, 255, 0.7);
  color: #fff;
  width: 20px;
  height: 20px;
  display: block;
  text-align: center;
  font-weight: 700;
  border-radius: 2px;
  position: absolute;
  top: 10px;
  right: 10px;
  &:hover,&:focus {
    background: rgba(181, 15, 15, 0.85);
    color: #fff;
    text-decoration: none;
  }
}

.box {
  font-size: 1.25rem;
  position: relative;
  padding: 30px;
  
  &--advance {
    outline: 2px dashed #ccc;
    outline-offset: -10px;
    transition: outline-offset .15s ease-in-out, background-color .15s linear;
    
    .box__dragndrop {
      display: inline;
    }
  }
  &--dragover {
    outline-offset: -20px;
    outline-color: #c8dadf;
    background-color: #fafafa;
  }
  &__input {
    text-align: center;
  }
  &__icon {
    width: 100%;
    display: block;
    color: #ccc;
    margin-bottom: 15px;
    font-size: 500%;
  }
  &__file {
    width: 0.1px;
    height: 0.1px;
    opacity: 0;
    overflow: hidden;
    position: absolute;
    z-index: -1;
    
    & + label {
      font-size: 1.25em;
      font-weight: 700;
      display: inline-block;
      cursor: pointer;
      margin-bottom: 0;
      
      strong {
        color: #39bfd3;
      }
    }
    &:focus + label {
      outline: 1px dotted #000;
      outline: -webkit-focus-ring-color auto 5px;
    }
    
  }
  &__dragndrop {
    display: none;
  }
}
</style>

</head>
<body>

<!-- 상단 고정 내비게이션 바 -->
<%@ include file="../common/navbar.jsp" %>

#mock-up

<script>
//Production steps of ECMA-262, Edition 6, 22.1.2.1
//Reference: https://people.mozilla.org/~jorendorff/es6-draft.html#sec-array.from
if (!Array.from) {
Array.from = (function () {
 var toStr = Object.prototype.toString;
 var isCallable = function (fn) {
   return typeof fn === 'function' || toStr.call(fn) === '[object Function]';
 };
 var toInteger = function (value) {
   var number = Number(value);
   if (isNaN(number)) { return 0; }
   if (number === 0 || !isFinite(number)) { return number; }
   return (number > 0 ? 1 : -1) * Math.floor(Math.abs(number));
 };
 var maxSafeInteger = Math.pow(2, 53) - 1;
 var toLength = function (value) {
   var len = toInteger(value);
   return Math.min(Math.max(len, 0), maxSafeInteger);
 };

 // The length property of the from method is 1.
 return function from(arrayLike/*, mapFn, thisArg */) {
   // 1. Let C be the this value.
   var C = this;

   // 2. Let items be ToObject(arrayLike).
   var items = Object(arrayLike);

   // 3. ReturnIfAbrupt(items).
   if (arrayLike == null) {
     throw new TypeError("Array.from requires an array-like object - not null or undefined");
   }

   // 4. If mapfn is undefined, then let mapping be false.
   var mapFn = arguments.length > 1 ? arguments[1] : void undefined;
   var T;
   if (typeof mapFn !== 'undefined') {
     // 5. else
     // 5. a If IsCallable(mapfn) is false, throw a TypeError exception.
     if (!isCallable(mapFn)) {
       throw new TypeError('Array.from: when provided, the second argument must be a function');
     }

     // 5. b. If thisArg was supplied, let T be thisArg; else let T be undefined.
     if (arguments.length > 2) {
       T = arguments[2];
     }
   }

   // 10. Let lenValue be Get(items, "length").
   // 11. Let len be ToLength(lenValue).
   var len = toLength(items.length);

   // 13. If IsConstructor(C) is true, then
   // 13. a. Let A be the result of calling the [[Construct]] internal method of C with an argument list containing the single item len.
   // 14. a. Else, Let A be ArrayCreate(len).
   var A = isCallable(C) ? Object(new C(len)) : new Array(len);

   // 16. Let k be 0.
   var k = 0;
   // 17. Repeat, while k < len… (also steps a - h)
   var kValue;
   while (k < len) {
     kValue = items[k];
     if (mapFn) {
       A[k] = typeof T === 'undefined' ? mapFn(kValue, k) : mapFn.call(T, kValue, k);
     } else {
       A[k] = kValue;
     }
     k += 1;
   }
   // 18. Let putStatus be Put(A, "length", len, true).
   A.length = len;
   // 20. Return A.
   return A;
 };
}());
}

if (!Array.prototype.find) {
Array.prototype.find = function(predicate) {
 if (this === null) {
   throw new TypeError('Array.prototype.find called on null or undefined');
 }
 if (typeof predicate !== 'function') {
   throw new TypeError('predicate must be a function');
 }
 var list = Object(this);
 var length = list.length >>> 0;
 var thisArg = arguments[1];
 var value;

 for (var i = 0; i < length; i++) {
   value = list[i];
   if (predicate.call(thisArg, value, i, list)) {
     return value;
   }
 }
 return undefined;
};
}

if (!Array.prototype.findIndex) {
Array.prototype.findIndex = function(predicate) {
 if (this === null) {
   throw new TypeError('Array.prototype.findIndex called on null or undefined');
 }
 if (typeof predicate !== 'function') {
   throw new TypeError('predicate must be a function');
 }
 var list = Object(this);
 var length = list.length >>> 0;
 var thisArg = arguments[1];
 var value;

 for (var i = 0; i < length; i++) {
   value = list[i];
   if (predicate.call(thisArg, value, i, list)) {
     return i;
   }
 }
 return -1;
};
}

const PhotoMode = Object.freeze({View: {}, Select: {}, Tag: {}, Remove: {}}); // enum
const PhotoStore = fluxify.createStore({
id: 'photoStore',
initialState: {
 tags: ['Front', 'Back', 'Right', 'Left', 'Top', 'Bottom', 'Other'],
 photos: [
     {id: 1, src: 'http://placehold.it/220x165/4FC1E9/ffffff/?text=Aqua', selected: false, tag: null},  
     {id: 2, src: 'http://placehold.it/220x165/FFCE54/ffffff/?text=Sun', selected: false, tag: null},
     {id: 3, src: 'http://placehold.it/220x165/48CFAD/ffffff/?text=Mint', selected: false, tag: null},
     {id: 4, src: 'http://placehold.it/220x165/ecf0f1/999999/?text=Clouds', selected: false, tag: null},
     {id: 5, src: 'http://placehold.it/220x165/c583ac/ffffff/?text=Orchid', selected: false, tag: null},
     {id: 6, src: 'http://placehold.it/220x165/8CC152/ffffff/?text=Grass', selected: false, tag: null}
 ]
},
actionCallbacks: {
 addPhoto(updater, src) {
   const photos = Array.from(this.photos);
   photos.push({id: photos.length + 1, src: src, selected: true});
   updater.set({photos});
 },
 removePhoto(updater, id) {
   const photos = Array.from(this.photos);
   photos.splice(photos.findIndex(p => p.id === id), 1);
   updater.set({photos});
 },
 selectPhoto(updater, id, selected) {
   const photos = Array.from(this.photos);
   const photo = photos.find(p => p.id === id);
   photo.selected = selected;
   updater.set({photos});
 },
 tagPhoto(updater, id, tag) {
   const photos = Array.from(this.photos);
   const photo = photos.find(p => p.id === id);
   photo.tag = tag;
   updater.set({photos});
 }
}
})

const PhotoSelector = ({id, selected, handleClick}) => (
<div className="checkbox">
 <label>
   <input type="checkbox" defaultChecked={selected} onClick={() => handleClick(id, !selected)}/>
   <i/>
 </label>
</div>
);

const PhotoTagger = ({id, tag, enabled, handleClick}) => (
<div className={`tag ${tag ? '' : 'tag--empty'}`}>
 { enabled ? <a href="#" className="tag__text dropdown-toggle" data-toggle="dropdown">{tag || 'Missing Tag'} <i className="fa fa-pencil"></i></a> : <span className="tag__text">{tag || 'Missing Tag'}</span> }
 { enabled ? <ul className="dropdown-menu">{PhotoStore.tags.map((t, i) => <li key={i}><a href="#" onClick={() => handleClick(id, t)}>{t}</a></li>)}</ul> : null }
</div>
);

const PhotoRemover = ({id, handleClick}) => (
<a href="#" className="photo__remove" title="remove this photo" onClick={() => handleClick(id)}>&times;</a>
);


const Photo = ({photo, mode, allowTagging, handleClick}) => (
<div className="col-xs-4 col-sm-3 col-md-2">
 <div className={`thumbnail ${mode === PhotoMode.Select && photo.selected ? 'selected' : ''}`}>
   <img src={photo.src} alt=""/>
   { mode === PhotoMode.Select ? <PhotoSelector id={photo.id} selected={photo.selected} handleClick={handleClick}/> : null }
   { mode === PhotoMode.View || mode === PhotoMode.Tag || mode === PhotoMode.Remove ? <PhotoTagger id={photo.id} tag={photo.tag} enabled={allowTagging} handleClick={handleClick}/> : null }
   { mode === PhotoMode.Remove ? <PhotoRemover id={photo.id} handleClick={handleClick}/> : null}
 </div>
</div>
)

const PhotoUpload = React.createClass({
preventDefault(e) {
 e.preventDefault();
 e.stopPropagation();
},
handleDragOver(e) {
 this.preventDefault(e);
 this.setState({dragover: true})
},
handleDragLeave(e) {
 this.preventDefault(e);
 this.setState({dragover: false});
},
handleDrop(e) {
 this.preventDefault(e);
 this.setState({dragover: false});
 this.props.handleSubmit(e.dataTransfer.files);
},
handleChange(e) {
 e.preventDefault();
 this.props.handleSubmit(e.target.files);
},

getDefaultProps() {
 return {multiple: false, accept: null, handleSubmit(files) {}};
},
getInitialState() {
 return {advance: false, dragover: false};
},
render() {
 const props = {
   ref: 'form',
   className: `box ${this.state.advance ? 'box--advance' : ''} ${this.state.dragover ? 'box--dragover' : ''}`,
   method: 'post',
   action: '',
   encType: 'multipart/form-data',
   onDrag: this.preventDefault,
   onDragStart: this.preventDefault,
   onDragEnd: this.handleDragLeave,
   onDragOver: this.handleDragOver,
   onDragEnter: this.handleDragOver,
   onDragLeave: this.handleDragLeave,
   onDrop: this.handleDrop
 }
 return (
   <form {...props}>
     <div className="box__input">
       <i className="box__icon fa fa-upload"/>
       <input ref="input" className="box__file" type="file" name="files[]" id="file" accept={this.props.accept} data-multiple-caption="{count} files selected" multiple={this.props.multiple} onChange={this.handleChange} />
       <label htmlFor="file"><strong>Choose a file</strong><span className="box__dragndrop"> or drag it here</span>.</label>
     </div>
   </form>
 );
},
componentDidMount() {
 var div = document.createElement('div');
 this.setState({advance: (('draggable' in div) || ('ondragstart' in div && 'ondrop' in div)) && 'FormData' in window && 'FileReader' in window});
}
});

const PhotoSection = React.createClass({
handleClick(id, value) {
 switch(this.props.mode) {
   case PhotoMode.Select:
     fluxify.doAction('selectPhoto', id, value);  
     break;
   case PhotoMode.Tag:
     fluxify.doAction('tagPhoto', id, value);
     break;
   case PhotoMode.Remove:
     fluxify.doAction('removePhoto', id);
     break;
 }
},
handleSubmit(files) {
 if(files) { 
    for(let i=0;i<files.length;i++) {
      var reader = new FileReader();
      reader.onload = (e) => fluxify.doAction('addPhoto', e.target.result);
      reader.readAsDataURL(files[i]);
    }
  }
},
updatePhotos(value) {
 this.setState({photos: value});
},

getDefaultProps() {
 return {title: '', mode: null};
},
getInitialState() {
 return {photos: PhotoStore.photos};
},
render() {
 const selected = this.state.photos.filter(p => p.selected);
 
 switch(this.props.mode) {
   case PhotoMode.View:
     return (
       <section className="photo-section">
         <h2>{this.props.title}</h2>
         <div className="row">
           {selected.map((p, i) => <Photo key={i} photo={p} mode={this.props.mode} allowTagging={false}/>)}
         </div>
       </section>
     );
   case PhotoMode.Select:
     return (
       <section className="photo-section">
         <h2>{this.props.title} {selected.length ? <small className="text-muted">({selected.length} photos selected)</small> : null}</h2>
         <div className="row">
           {this.state.photos.map((p, i) => <Photo key={i} photo={p} mode={this.props.mode} allowTagging={false} handleClick={this.handleClick}/>)}
         </div>
         <PhotoUpload multiple={true} accept={'.jpg,.jpeg,.png,.tif,.tiff,.gif'} handleSubmit={this.handleSubmit}/>
       </section>
     );
   case PhotoMode.Tag:
     const number = selected.filter(p => !p.tag).length;
     return (
       <section className="photo-section">
         <h2>{this.props.title} {number ? <small className="text-danger">({number} photos missing tag)</small> : null}</h2>
         <div className="row">
           {selected.map((p, i) => <Photo key={i} photo={p} mode={this.props.mode} allowTagging={true} handleClick={this.handleClick}/>)}
         </div>
       </section>
     );
   case PhotoMode.Remove:
     return (
       <section className="photo-section">
         <h2>{this.props.title}</h2>
         <div className="row">
           {selected.map((p, i) => <Photo key={i} photo={p} mode={this.props.mode} allowTagging={false} handleClick={this.handleClick}/>)}
         </div>
       </section>
     );
   default:
     return <section/>;
 }
},
componentDidMount() {
 PhotoStore.on('change:photos', this.updatePhotos);
},
componentWillUnmount() {
 Photostore.off('change:photos', this.updatePhotos);
}
});

const MockUp = React.createClass({
handleClick(mode, e) {
 e.preventDefault();
 this.setState({mode});
},
getInitialState() {
 return {mode: PhotoMode.Select};
},
render() {
 return (
   <div className="container">
     <h1>Mock-Up: Photos <small className="text-muted">using <a href="https://facebook.github.io/react/">React</a>, <a href="https://github.com/arqex/fluxify">Fluxify</a> &amp; <a href="https://getbootstrap.com/">Bootstrap</a></small></h1>
     <ul className="nav nav-tabs">
       <li className="active"><a href="#" onClick={this.handleClick.bind(null, PhotoMode.Select)}>Selecting</a></li>
       <li><a href="#" onClick={this.handleClick.bind(null, PhotoMode.Tag)}>Tagging</a></li>
       <li><a href="#" onClick={this.handleClick.bind(null, PhotoMode.View)}>Viewing</a></li>
       <li><a href="#" onClick={this.handleClick.bind(null, PhotoMode.Remove)}>Removing</a></li>
     </ul>
     <div className="tab-content">
       <div className="tab-pane active" id="select">
         <PhotoSection title="Select Photos" mode={this.state.mode}/>
       </div>
     </div>
     
     <p style={{marginTop: 40}}><small>* Due to this being just a mock-up, we're faking the uploading using photo preview <em>(the form submit is not implemented)</em>. You can find more information on the drag &amp; drop uploading at <a href="https://css-tricks.com/drag-and-drop-file-uploading/">css-tricks</a>.</small></p>
   </div>
 );
}
})

ReactDOM.render(<MockUp/>, document.querySelector('#mock-up'));
</script>

<%-- <%@ include file="../common/footer.jsp" %> --%>
</body>
</html>