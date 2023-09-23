import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faUserNurse } from "@fortawesome/free-solid-svg-icons";

const Header = () => {
  return (
    <header>
      <div>
        <FontAwesomeIcon icon={faUserNurse} />
        <span>SKKU Medical</span>
      </div>
      <div>
        <button>Login</button>
      </div>
    </header>
  );
};

export default Header;
