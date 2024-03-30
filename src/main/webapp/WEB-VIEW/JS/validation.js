// VALIDATION
console.log("cc");
function Validator(job) {
	var workplace = document.querySelector(job.workplace);
	var listRule = {};
	
	workplace.onsubmit = function(e) {
		e.preventDefault();
		
        workplace.querySelectorAll(".invalid-feedback").forEach(function(element){
            element.classList.add("d-block")
        })

		var isFormValid = 0;

		job.rules.forEach(function(rule) {
			var workplaceElement = workplace.querySelector(rule.select);
			
			var isValid = validate(workplaceElement, rule);
			
			if (isValid) {
                isFormValid++;
            }
		});
		
        if (isFormValid === 0) {
           workplace.submit();
        }
	}
	
	function getParent(workplaceElement, parent) {
		while(workplaceElement.parentElement){
			if(workplaceElement.parentElement.matches(parent)) {
				return workplaceElement.parentElement;
			}
			workplaceElement = workplaceElement.parentElement;
		}
	}
	
	function validate(workplaceElement, rule) {
		var errorMessage = "";
		for(var i = 0; i < listRule[rule.select].length; i++){
			switch(workplaceElement.type){
					case "radio":
					case "checkbox":
						errorMessage = listRule[rule.select][i](workplace.querySelector(rule.select + ":checked") ? workplace.querySelector(rule.select + ":checked").value : undefined)
						break; 
					default:
						errorMessage = listRule[rule.select][i](workplaceElement.value)
						break;
					
			};
			if(errorMessage){
				break;
			}
		}
		
		if(errorMessage){
			getParent(workplaceElement, job.formGroupSelector).querySelector(".invalid-feedback").innerHTML = errorMessage;
			getParent(workplaceElement, job.formGroupSelector).querySelector(".invalid-feedback").style.color = "red";
		} else {
			getParent(workplaceElement, job.formGroupSelector).querySelector(".invalid-feedback").innerHTML = "";
		}
		
		return errorMessage;
	}
	
	job.rules.forEach(function(rule) {
		var workplaceElements = workplace.querySelectorAll(rule.select);
		
		if(Array.isArray(listRule[rule.select])){
			listRule[rule.select].push(rule.test)
		} else {
			listRule[rule.select] = [rule.test];
		}
		
		Array.from(workplaceElements).forEach(function(workplaceElement){
			workplaceElement.onblur = function() {
				validate(workplaceElement, rule);

                workplace.querySelectorAll(".invalid-feedback").forEach(function(element){
                    element.classList.add("d-block")
                })
			};
            
            workplaceElement.oninput = function () {
                var errorElement = getParent(workplaceElement, job.formGroupSelector).querySelector(".invalid-feedback");
                errorElement.innerText = "";
            }       
		})
	})
}

// RULE
Validator.isRequired = function(select, message) {
	return {
		select: select,
		test: function(value) {
			return value ? undefined : message || "Vui lòng nhập trường này";
		}
	}
}

Validator.isEmail = function(select, message) {
	return {
		select: select,
		test: function(value) {
			var regex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
			return regex.test(value) ? undefined :  message || 'Trường này phải là email';
		}
	}
}


Validator.isLengthMin = function(select, minValue, message) {
	return {
		select: select,
		test: function(value) {
			var min = minValue ? minValue : 6
			return value.length >= min ? undefined :  message || `Trường này phải chứa ít nhất ${min} ký tự`;
		}
	}
}

Validator.isConfirm = function(select, confirm, message) {
	return {
		select: select,
		test: function(value) {
			return value == confirm() ? undefined :  message || `Trường này nhập không đúng`;
		}
	}
}

Validator.isPhone = function(select, message) {
	return {
		select: select,
		test: function(value) {
			var regex = /^(0\d{9,10})$/;
			return regex.test(value) ? undefined :  message || 'Trường này phải là phone';
		}
	}
}