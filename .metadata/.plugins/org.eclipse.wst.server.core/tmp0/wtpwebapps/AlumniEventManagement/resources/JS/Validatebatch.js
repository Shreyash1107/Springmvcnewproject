		function validateBatchForm() {
			let batchYear = document.getElementById("passoutYear").value.trim();
			let batchError = document.getElementById("passoutYearError");

			let isBatchValid = true;
			let isDept1Valid = true;
			let isDept2Valid = true;

			// Validate Batch Year
			if (batchYear === "") {
				batchError.innerHTML = "Pass-out Batch cannot be empty.";
				isBatchValid = false;
			} else if (!/^\d{4}$/.test(batchYear)) {
				batchError.innerHTML = "Pass-out Batch should be a 4-digit number.";
				isBatchValid = false;
			} else {
				batchError.innerHTML = "";
			}

			// Validate First Department Dropdown
			if (!validateDropdown("deptSelect", "deptError1")) {
				isDept1Valid = false;
			}

			// Validate Second Department Dropdown
			if (!validateDropdown("deptSelect2", "deptError2")) {
				isDept2Valid = false;
			}

			return isBatchValid && isDept1Valid && isDept2Valid;
		}

		document.querySelector("form[name='frm']").onsubmit = function () {
			return validateBatchForm();
		};

		document.getElementById("passoutYear").addEventListener("input", function (event) {
			const value = event.target.value;
			event.target.value = value.replace(/\D/g, '');
		});