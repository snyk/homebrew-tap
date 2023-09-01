class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1209.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1209.0/snyk-macos"
    sha256 "a9afcdb4a06def87b31be2646096d007684a8ce07fa08c009ece208d44e1d42e"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1209.0/snyk-linux"
    sha256 "d381dad812f0f9e10cd6531b3cbafacd166db1ceeee09dc2c7400d9cf603200d"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
