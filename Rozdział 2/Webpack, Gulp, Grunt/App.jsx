import "../../styles/common.css"

import React from "react";
import Note from "./Note.jsx";

export default class App extends React.Component {
    render() {
        var tab = [];
        for (var i = 0; i < 5; i++) {
            tab.push(<Note />)
        }

        return <div>{tab}</div>
    }
}