## Installing stress-ng through Tarball on CentOS

### Step-by-Step Installation

#### Download the tarball:
Go to the `stress-ng` GitHub releases page or another trusted source to download the tarball. For example, if you're downloading version 0.12.03:

```bash
wget https://github.com/ColinIanKing/stress-ng/archive/V0.12.03.tar.gz
```

#### Extraction
```bash
tar -xzvf V0.12.03.tar.gz
```

#### Navigate to directory
```bash
cd stress-ng-0.12.03
```

#### Install bundle
```bash
sudo yum install gcc make
```

#### Compile and install
```bash
make
sudo make install
```

#### Verify
```bash
stress-ng --version
```

#### Cleanup
```bash
rm V0.12.03.tar.gz
rm -rf stress-ng-0.12.03

```
