"use strict";
/*
 * ATTENTION: An "eval-source-map" devtool has been used.
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file with attached SourceMaps in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
self["webpackHotUpdate_N_E"]("pages/login",{

/***/ "./pages/login/index.js":
/*!******************************!*\
  !*** ./pages/login/index.js ***!
  \******************************/
/***/ (function(module, __webpack_exports__, __webpack_require__) {

eval(__webpack_require__.ts("__webpack_require__.r(__webpack_exports__);\n/* harmony export */ __webpack_require__.d(__webpack_exports__, {\n/* harmony export */   \"default\": function() { return /* binding */ Login; }\n/* harmony export */ });\n/* harmony import */ var react_jsx_dev_runtime__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! react/jsx-dev-runtime */ \"./node_modules/react/jsx-dev-runtime.js\");\n/* harmony import */ var react_jsx_dev_runtime__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(react_jsx_dev_runtime__WEBPACK_IMPORTED_MODULE_0__);\n/* harmony import */ var next_head__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! next/head */ \"./node_modules/next/head.js\");\n/* harmony import */ var next_head__WEBPACK_IMPORTED_MODULE_1___default = /*#__PURE__*/__webpack_require__.n(next_head__WEBPACK_IMPORTED_MODULE_1__);\n/* harmony import */ var react__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! react */ \"./node_modules/react/index.js\");\n/* harmony import */ var react__WEBPACK_IMPORTED_MODULE_2___default = /*#__PURE__*/__webpack_require__.n(react__WEBPACK_IMPORTED_MODULE_2__);\n/* harmony import */ var next_router__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! next/router */ \"./node_modules/next/router.js\");\n/* harmony import */ var next_router__WEBPACK_IMPORTED_MODULE_3___default = /*#__PURE__*/__webpack_require__.n(next_router__WEBPACK_IMPORTED_MODULE_3__);\n\nvar _s = $RefreshSig$();\n\n\n // useRouter 추가\nfunction Login() {\n    _s();\n    const [id, setId] = (0,react__WEBPACK_IMPORTED_MODULE_2__.useState)(\"\");\n    const [password, setPassword] = (0,react__WEBPACK_IMPORTED_MODULE_2__.useState)(\"\");\n    const [signup, setsignUp] = (0,react__WEBPACK_IMPORTED_MODULE_2__.useState)(false);\n    const router = (0,next_router__WEBPACK_IMPORTED_MODULE_3__.useRouter)(); // useRouter를 사용하여 라우터 객체 생성\n    const handleIdChange = (e)=>{\n        setId(e.target.value);\n    };\n    const handlePasswordChange = (e)=>{\n        setPassword(e.target.value);\n    };\n    const handleLoginSubmit = (e)=>{\n        e.preventDefault();\n        console.log(\"Id: \".concat(id, \", Password: \").concat(password));\n    // 여기서 로그인 성공 시 다른 곳으로 이동 (예: '/dashboard'로 이동)\n    // router.push('/dashboard');\n    };\n    const handleSignupSubmit = (e)=>{\n        e.preventDefault();\n        setsignUp(true);\n        // signup이 true일 때, signup 폴더에 있는 index 페이지로 이동\n        if (signup) {\n            router.push(\"/signup\");\n        }\n    };\n    return /*#__PURE__*/ (0,react_jsx_dev_runtime__WEBPACK_IMPORTED_MODULE_0__.jsxDEV)(\"div\", {\n        className: \"login-container\",\n        children: [\n            /*#__PURE__*/ (0,react_jsx_dev_runtime__WEBPACK_IMPORTED_MODULE_0__.jsxDEV)((next_head__WEBPACK_IMPORTED_MODULE_1___default()), {\n                children: /*#__PURE__*/ (0,react_jsx_dev_runtime__WEBPACK_IMPORTED_MODULE_0__.jsxDEV)(\"title\", {\n                    children: \"Login\"\n                }, void 0, false, {\n                    fileName: \"/Users/x2qpcheese/Desktop/SKKU.THON-Team9/skkuthon-team-9/pages/login/index.js\",\n                    lineNumber: 36,\n                    columnNumber: 17\n                }, this)\n            }, void 0, false, {\n                fileName: \"/Users/x2qpcheese/Desktop/SKKU.THON-Team9/skkuthon-team-9/pages/login/index.js\",\n                lineNumber: 35,\n                columnNumber: 13\n            }, this),\n            /*#__PURE__*/ (0,react_jsx_dev_runtime__WEBPACK_IMPORTED_MODULE_0__.jsxDEV)(\"h2\", {\n                children: \"Log in\"\n            }, void 0, false, {\n                fileName: \"/Users/x2qpcheese/Desktop/SKKU.THON-Team9/skkuthon-team-9/pages/login/index.js\",\n                lineNumber: 39,\n                columnNumber: 13\n            }, this),\n            /*#__PURE__*/ (0,react_jsx_dev_runtime__WEBPACK_IMPORTED_MODULE_0__.jsxDEV)(\"form\", {\n                onSubmit: handleLoginSubmit,\n                className: \"login-form-wrapper\",\n                children: [\n                    /*#__PURE__*/ (0,react_jsx_dev_runtime__WEBPACK_IMPORTED_MODULE_0__.jsxDEV)(\"input\", {\n                        type: \"id\",\n                        id: \"id\",\n                        value: id,\n                        onChange: handleIdChange,\n                        placeholder: \"id\"\n                    }, void 0, false, {\n                        fileName: \"/Users/x2qpcheese/Desktop/SKKU.THON-Team9/skkuthon-team-9/pages/login/index.js\",\n                        lineNumber: 41,\n                        columnNumber: 21\n                    }, this),\n                    /*#__PURE__*/ (0,react_jsx_dev_runtime__WEBPACK_IMPORTED_MODULE_0__.jsxDEV)(\"input\", {\n                        type: \"password\",\n                        id: \"password\",\n                        value: password,\n                        onChange: handlePasswordChange,\n                        placeholder: \"password\"\n                    }, void 0, false, {\n                        fileName: \"/Users/x2qpcheese/Desktop/SKKU.THON-Team9/skkuthon-team-9/pages/login/index.js\",\n                        lineNumber: 48,\n                        columnNumber: 21\n                    }, this),\n                    /*#__PURE__*/ (0,react_jsx_dev_runtime__WEBPACK_IMPORTED_MODULE_0__.jsxDEV)(\"input\", {\n                        type: \"submit\",\n                        value: \"Login\"\n                    }, void 0, false, {\n                        fileName: \"/Users/x2qpcheese/Desktop/SKKU.THON-Team9/skkuthon-team-9/pages/login/index.js\",\n                        lineNumber: 55,\n                        columnNumber: 17\n                    }, this)\n                ]\n            }, void 0, true, {\n                fileName: \"/Users/x2qpcheese/Desktop/SKKU.THON-Team9/skkuthon-team-9/pages/login/index.js\",\n                lineNumber: 40,\n                columnNumber: 13\n            }, this),\n            /*#__PURE__*/ (0,react_jsx_dev_runtime__WEBPACK_IMPORTED_MODULE_0__.jsxDEV)(\"form\", {\n                onSubmit: handleSignupSubmit,\n                children: /*#__PURE__*/ (0,react_jsx_dev_runtime__WEBPACK_IMPORTED_MODULE_0__.jsxDEV)(\"button\", {\n                    type: \"submit\",\n                    children: \"Sign up\"\n                }, void 0, false, {\n                    fileName: \"/Users/x2qpcheese/Desktop/SKKU.THON-Team9/skkuthon-team-9/pages/login/index.js\",\n                    lineNumber: 58,\n                    columnNumber: 17\n                }, this)\n            }, void 0, false, {\n                fileName: \"/Users/x2qpcheese/Desktop/SKKU.THON-Team9/skkuthon-team-9/pages/login/index.js\",\n                lineNumber: 57,\n                columnNumber: 13\n            }, this)\n        ]\n    }, void 0, true, {\n        fileName: \"/Users/x2qpcheese/Desktop/SKKU.THON-Team9/skkuthon-team-9/pages/login/index.js\",\n        lineNumber: 34,\n        columnNumber: 9\n    }, this);\n}\n_s(Login, \"7avQjEUNxpmPJztBbrgpyIg7RuI=\", false, function() {\n    return [\n        next_router__WEBPACK_IMPORTED_MODULE_3__.useRouter\n    ];\n});\n_c = Login;\nvar _c;\n$RefreshReg$(_c, \"Login\");\n\n\n;\n    // Wrapped in an IIFE to avoid polluting the global scope\n    ;\n    (function () {\n        var _a, _b;\n        // Legacy CSS implementations will `eval` browser code in a Node.js context\n        // to extract CSS. For backwards compatibility, we need to check we're in a\n        // browser context before continuing.\n        if (typeof self !== 'undefined' &&\n            // AMP / No-JS mode does not inject these helpers:\n            '$RefreshHelpers$' in self) {\n            // @ts-ignore __webpack_module__ is global\n            var currentExports = module.exports;\n            // @ts-ignore __webpack_module__ is global\n            var prevExports = (_b = (_a = module.hot.data) === null || _a === void 0 ? void 0 : _a.prevExports) !== null && _b !== void 0 ? _b : null;\n            // This cannot happen in MainTemplate because the exports mismatch between\n            // templating and execution.\n            self.$RefreshHelpers$.registerExportsForReactRefresh(currentExports, module.id);\n            // A module can be accepted automatically based on its exports, e.g. when\n            // it is a Refresh Boundary.\n            if (self.$RefreshHelpers$.isReactRefreshBoundary(currentExports)) {\n                // Save the previous exports on update so we can compare the boundary\n                // signatures.\n                module.hot.dispose(function (data) {\n                    data.prevExports = currentExports;\n                });\n                // Unconditionally accept an update to this module, we'll check if it's\n                // still a Refresh Boundary later.\n                // @ts-ignore importMeta is replaced in the loader\n                module.hot.accept();\n                // This field is set when the previous version of this module was a\n                // Refresh Boundary, letting us know we need to check for invalidation or\n                // enqueue an update.\n                if (prevExports !== null) {\n                    // A boundary can become ineligible if its exports are incompatible\n                    // with the previous exports.\n                    //\n                    // For example, if you add/remove/change exports, we'll want to\n                    // re-execute the importing modules, and force those components to\n                    // re-render. Similarly, if you convert a class component to a\n                    // function, we want to invalidate the boundary.\n                    if (self.$RefreshHelpers$.shouldInvalidateReactRefreshBoundary(prevExports, currentExports)) {\n                        module.hot.invalidate();\n                    }\n                    else {\n                        self.$RefreshHelpers$.scheduleUpdate();\n                    }\n                }\n            }\n            else {\n                // Since we just executed the code for the module, it's possible that the\n                // new exports made it ineligible for being a boundary.\n                // We only care about the case when we were _previously_ a boundary,\n                // because we already accepted this update (accidental side effect).\n                var isNoLongerABoundary = prevExports !== null;\n                if (isNoLongerABoundary) {\n                    module.hot.invalidate();\n                }\n            }\n        }\n    })();\n//# sourceURL=[module]\n//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiLi9wYWdlcy9sb2dpbi9pbmRleC5qcyIsIm1hcHBpbmdzIjoiOzs7Ozs7Ozs7Ozs7OztBQUE0QjtBQUNLO0FBQ08sQ0FBQyxlQUFlO0FBR3pDLFNBQVNHOztJQUNwQixNQUFNLENBQUNDLElBQUlDLE1BQU0sR0FBR0osK0NBQVFBLENBQUM7SUFDN0IsTUFBTSxDQUFDSyxVQUFVQyxZQUFZLEdBQUdOLCtDQUFRQSxDQUFDO0lBQ3pDLE1BQU0sQ0FBQ08sUUFBUUMsVUFBVSxHQUFHUiwrQ0FBUUEsQ0FBQztJQUNyQyxNQUFNUyxTQUFTUixzREFBU0EsSUFBSSw0QkFBNEI7SUFDeEQsTUFBTVMsaUJBQWlCLENBQUNDO1FBQ3BCUCxNQUFNTyxFQUFFQyxNQUFNLENBQUNDLEtBQUs7SUFDeEI7SUFDQSxNQUFNQyx1QkFBdUIsQ0FBQ0g7UUFDMUJMLFlBQVlLLEVBQUVDLE1BQU0sQ0FBQ0MsS0FBSztJQUM5QjtJQUNBLE1BQU1FLG9CQUFvQixDQUFDSjtRQUN2QkEsRUFBRUssY0FBYztRQUNoQkMsUUFBUUMsR0FBRyxDQUFDLE9BQXdCYixPQUFqQkYsSUFBRyxnQkFBdUIsT0FBVEU7SUFDcEMsK0NBQStDO0lBQy9DLDZCQUE2QjtJQUNqQztJQUVBLE1BQU1jLHFCQUFxQixDQUFDUjtRQUN4QkEsRUFBRUssY0FBYztRQUNoQlIsVUFBVTtRQUNWLCtDQUErQztRQUMvQyxJQUFJRCxRQUFRO1lBQ1JFLE9BQU9XLElBQUksQ0FBQztRQUNoQjtJQUNKO0lBRUEscUJBQ0ksOERBQUNDO1FBQUlDLFdBQVU7OzBCQUNYLDhEQUFDdkIsa0RBQUlBOzBCQUNELDRFQUFDd0I7OEJBQU07Ozs7Ozs7Ozs7OzBCQUdYLDhEQUFDQzswQkFBRzs7Ozs7OzBCQUNKLDhEQUFDQztnQkFBS0MsVUFBVVg7Z0JBQW1CTyxXQUFVOztrQ0FDckMsOERBQUNLO3dCQUNHQyxNQUFLO3dCQUNMekIsSUFBRzt3QkFDSFUsT0FBT1Y7d0JBQ1AwQixVQUFVbkI7d0JBQ1ZvQixhQUFZOzs7Ozs7a0NBRWhCLDhEQUFDSDt3QkFDR0MsTUFBSzt3QkFDTHpCLElBQUc7d0JBQ0hVLE9BQU9SO3dCQUNQd0IsVUFBVWY7d0JBQ1ZnQixhQUFZOzs7Ozs7a0NBRXBCLDhEQUFDSDt3QkFBTUMsTUFBSzt3QkFBU2YsT0FBTTs7Ozs7Ozs7Ozs7OzBCQUUvQiw4REFBQ1k7Z0JBQUtDLFVBQVVQOzBCQUNaLDRFQUFDWTtvQkFBT0gsTUFBSzs4QkFBUzs7Ozs7Ozs7Ozs7Ozs7Ozs7QUFJdEM7R0F4RHdCMUI7O1FBSUxELGtEQUFTQTs7O0tBSkpDIiwic291cmNlcyI6WyJ3ZWJwYWNrOi8vX05fRS8uL3BhZ2VzL2xvZ2luL2luZGV4LmpzPzkxZmEiXSwic291cmNlc0NvbnRlbnQiOlsiaW1wb3J0IEhlYWQgZnJvbSAnbmV4dC9oZWFkJ1xuaW1wb3J0IHsgdXNlU3RhdGUgfSBmcm9tICdyZWFjdCc7XG5pbXBvcnQgeyB1c2VSb3V0ZXIgfSBmcm9tICduZXh0L3JvdXRlcic7IC8vIHVzZVJvdXRlciDstpTqsIBcblxuXG5leHBvcnQgZGVmYXVsdCBmdW5jdGlvbiBMb2dpbigpIHtcbiAgICBjb25zdCBbaWQsIHNldElkXSA9IHVzZVN0YXRlKCcnKTtcbiAgICBjb25zdCBbcGFzc3dvcmQsIHNldFBhc3N3b3JkXSA9IHVzZVN0YXRlKCcnKTtcbiAgICBjb25zdCBbc2lnbnVwLCBzZXRzaWduVXBdID0gdXNlU3RhdGUoZmFsc2UpO1xuICAgIGNvbnN0IHJvdXRlciA9IHVzZVJvdXRlcigpOyAvLyB1c2VSb3V0ZXLrpbwg7IKs7Jqp7ZWY7JesIOudvOyasO2EsCDqsJ3ssrQg7IOd7ISxXG4gICAgY29uc3QgaGFuZGxlSWRDaGFuZ2UgPSAoZSkgPT4ge1xuICAgICAgICBzZXRJZChlLnRhcmdldC52YWx1ZSk7XG4gICAgfTtcbiAgICBjb25zdCBoYW5kbGVQYXNzd29yZENoYW5nZSA9IChlKSA9PiB7XG4gICAgICAgIHNldFBhc3N3b3JkKGUudGFyZ2V0LnZhbHVlKTtcbiAgICB9O1xuICAgIGNvbnN0IGhhbmRsZUxvZ2luU3VibWl0ID0gKGUpID0+IHtcbiAgICAgICAgZS5wcmV2ZW50RGVmYXVsdCgpO1xuICAgICAgICBjb25zb2xlLmxvZyhgSWQ6ICR7aWR9LCBQYXNzd29yZDogJHtwYXNzd29yZH1gKTtcbiAgICAgICAgLy8g7Jes6riw7IScIOuhnOq3uOyduCDshLHqs7Ug7IucIOuLpOuluCDqs7PsnLzroZwg7J2064+ZICjsmIg6ICcvZGFzaGJvYXJkJ+uhnCDsnbTrj5kpXG4gICAgICAgIC8vIHJvdXRlci5wdXNoKCcvZGFzaGJvYXJkJyk7XG4gICAgfTtcbiAgICBcbiAgICBjb25zdCBoYW5kbGVTaWdudXBTdWJtaXQgPSAoZSkgPT4ge1xuICAgICAgICBlLnByZXZlbnREZWZhdWx0KCk7XG4gICAgICAgIHNldHNpZ25VcCh0cnVlKTtcbiAgICAgICAgLy8gc2lnbnVw7J20IHRydWXsnbwg65WMLCBzaWdudXAg7Y+0642U7JeQIOyeiOuKlCBpbmRleCDtjpjsnbTsp4DroZwg7J2064+ZXG4gICAgICAgIGlmIChzaWdudXApIHtcbiAgICAgICAgICAgIHJvdXRlci5wdXNoKCcvc2lnbnVwJyk7XG4gICAgICAgIH1cbiAgICB9XG5cbiAgICByZXR1cm4gKFxuICAgICAgICA8ZGl2IGNsYXNzTmFtZT0nbG9naW4tY29udGFpbmVyJz5cbiAgICAgICAgICAgIDxIZWFkPlxuICAgICAgICAgICAgICAgIDx0aXRsZT5Mb2dpbjwvdGl0bGU+XG4gICAgICAgIDwvSGVhZD5cbiAgICAgICAgICAgIFxuICAgICAgICAgICAgPGgyPkxvZyBpbjwvaDI+XG4gICAgICAgICAgICA8Zm9ybSBvblN1Ym1pdD17aGFuZGxlTG9naW5TdWJtaXR9IGNsYXNzTmFtZT0nbG9naW4tZm9ybS13cmFwcGVyJz5cbiAgICAgICAgICAgICAgICAgICAgPGlucHV0XG4gICAgICAgICAgICAgICAgICAgICAgICB0eXBlPVwiaWRcIlxuICAgICAgICAgICAgICAgICAgICAgICAgaWQ9XCJpZFwiXG4gICAgICAgICAgICAgICAgICAgICAgICB2YWx1ZT17aWR9XG4gICAgICAgICAgICAgICAgICAgICAgICBvbkNoYW5nZT17aGFuZGxlSWRDaGFuZ2V9XG4gICAgICAgICAgICAgICAgICAgICAgICBwbGFjZWhvbGRlcj0naWQnXG4gICAgICAgICAgICAgICAgICAgIC8+XG4gICAgICAgICAgICAgICAgICAgIDxpbnB1dFxuICAgICAgICAgICAgICAgICAgICAgICAgdHlwZT1cInBhc3N3b3JkXCJcbiAgICAgICAgICAgICAgICAgICAgICAgIGlkPVwicGFzc3dvcmRcIlxuICAgICAgICAgICAgICAgICAgICAgICAgdmFsdWU9e3Bhc3N3b3JkfVxuICAgICAgICAgICAgICAgICAgICAgICAgb25DaGFuZ2U9e2hhbmRsZVBhc3N3b3JkQ2hhbmdlfVxuICAgICAgICAgICAgICAgICAgICAgICAgcGxhY2Vob2xkZXI9J3Bhc3N3b3JkJ1xuICAgICAgICAgICAgICAgICAgICAvPlxuICAgICAgICAgICAgICAgIDxpbnB1dCB0eXBlPVwic3VibWl0XCIgdmFsdWU9XCJMb2dpblwiLz5cbiAgICAgICAgICAgIDwvZm9ybT5cbiAgICAgICAgICAgIDxmb3JtIG9uU3VibWl0PXtoYW5kbGVTaWdudXBTdWJtaXR9PlxuICAgICAgICAgICAgICAgIDxidXR0b24gdHlwZT1cInN1Ym1pdFwiPlNpZ24gdXA8L2J1dHRvbj5cbiAgICAgICAgICAgIDwvZm9ybT5cbiAgICAgICAgPC9kaXY+XG4gICAgKTtcbn1cbiJdLCJuYW1lcyI6WyJIZWFkIiwidXNlU3RhdGUiLCJ1c2VSb3V0ZXIiLCJMb2dpbiIsImlkIiwic2V0SWQiLCJwYXNzd29yZCIsInNldFBhc3N3b3JkIiwic2lnbnVwIiwic2V0c2lnblVwIiwicm91dGVyIiwiaGFuZGxlSWRDaGFuZ2UiLCJlIiwidGFyZ2V0IiwidmFsdWUiLCJoYW5kbGVQYXNzd29yZENoYW5nZSIsImhhbmRsZUxvZ2luU3VibWl0IiwicHJldmVudERlZmF1bHQiLCJjb25zb2xlIiwibG9nIiwiaGFuZGxlU2lnbnVwU3VibWl0IiwicHVzaCIsImRpdiIsImNsYXNzTmFtZSIsInRpdGxlIiwiaDIiLCJmb3JtIiwib25TdWJtaXQiLCJpbnB1dCIsInR5cGUiLCJvbkNoYW5nZSIsInBsYWNlaG9sZGVyIiwiYnV0dG9uIl0sInNvdXJjZVJvb3QiOiIifQ==\n//# sourceURL=webpack-internal:///./pages/login/index.js\n"));

/***/ })

});