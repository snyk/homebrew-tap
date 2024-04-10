class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1288.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1288.0/snyk-macos"
    sha256 "4870515244dbfd1bfed6594538c149a1e3a2873704bb2973ec2a0abadb299b7c"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1288.0/snyk-macos-arm64"
    sha256 "c34ffa033dfb2f389b53baf8edc89e38e5ebf2236187ef2628327d3d0755045d"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1288.0/snyk-linux"
    sha256 "cb90da3d236be0bc352217203ac12c033c87aa6cd24fe9ae45247fbe328ecb88"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1288.0/snyk-linux-arm64"
    sha256 "a34494f8f3ac52f6b936e777544fafdb0ebbc3bb6a7bacd1a485984022d9f9be"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
