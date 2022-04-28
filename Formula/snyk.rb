class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.914.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.914.0/snyk-macos"
    sha256 "97fc805432ab5cccada7ecd26735f60a2f392bf6fa352feacdbe173c7d47a58b"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.914.0/snyk-linux"
    sha256 "f4b15b35babf233d9eaf8df1cfd8f258b0580580e91f622b9859e8b20dfe5ed8"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
