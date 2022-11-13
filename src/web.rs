use wasm_bindgen::prelude::*;

use super::add;

// https://developer.mozilla.org/en-US/docs/WebAssembly/Rust_to_wasm

#[wasm_bindgen]
extern {
	fn alert(s: &str);
}

#[wasm_bindgen]
pub fn alert_add_result(lhs: i32, rhs: i32) {
	alert(&format!("{} + {} = {}", lhs, rhs, add(lhs, rhs)));
}
