import styles from "./styles.jsx";

const desktopStyle = {
    display: "inline-block",
    minWidth: "32px",
    textAlign: "center",
    paddingTop: "2px",
    paddingBottom: "0px",
    color: "rgba(255, 255, 255, 0.5)"
};

const renderSpace = (index, focused, visible, _) => {
    let contentStyle = JSON.parse(JSON.stringify(desktopStyle));
    if (focused == 1) {
        contentStyle.color = "rgba(255, 255, 255, 1)";
    }
    return (
        <div style={contentStyle} key={index}>
            {index}
        </div>
    );
};

const render = ({output}) => {

    if (typeof output === "undefined") return null;

    const spaces = [];
    output.spaces.forEach(function(space) {
        spaces.push(renderSpace(space.index, space.focused, space.visible, space.windows));
    });
    return (
        <div>
            {spaces}
        </div>
    );
};

export default render;
