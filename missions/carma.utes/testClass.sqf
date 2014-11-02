CarmaSingleton carmaClassDef {
    protectedStatic {
        instance = nil;
    };
    publicStatic {
        getInstance = {
            _instance = CarmaSingleton::instance;
            if(isNil "_instance") then {
                CarmaSingleton::instance = carmaClass CarmaSingleton();
            };
            CarmaSingleton::instance;
        };
    };
    CarmaSingleton {
        _instance = CarmaSingleton::instance;
        assert(isNil "_instance");
    };
    protected {
        _var = 1;
    };
    public {
        test = {
            player sideChat format["Hi! %1", _self._var];
            _self._var = _self._var + 1;
        };
    };
};

CarmaSingleton::getInstance().test(); // 1
CarmaSingleton::getInstance().test(); // 2
CarmaSingleton::getInstance().test(); // 3
CarmaSingleton::getInstance().test(); // 4