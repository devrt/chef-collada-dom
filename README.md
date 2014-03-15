collada-dom Cookbook
====================

This cookbook will install collada-dom library.

Requirements
------------

- `build-essential` - collada-dom requires c++ compiler.
- `cmake` - collada-dom requires omniORB.
- `xml` - collada-dom requires OpenRTM-aist.

Attributes
----------

No attributes yet.

Usage
-----

Just include `collada-dom` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[collada-dom]"
  ]
}
```

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------

Apache 2.0

Authors: Yosuke Matsusaka
