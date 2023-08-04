class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1200.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1200.0/snyk-macos"
    sha256 "7b23b69844f437ef787f88318f7cd97c372d46d94537067bd498a69cae08980c"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1200.0/snyk-linux"
    sha256 "923daff415e81a6a625993d419b59de7e2fd17caf08e9a08060901bd89da3c33"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
