class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.869.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.869.0/snyk-macos"
    sha256 "fa075b1a623fbf5feecc63020af05a380b3f997333dc7d32e62e832454974ca8"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.869.0/snyk-linux"
    sha256 "8eddf9433453e5afe5d74e7afd6a3fccbf5ddcc5d0bd4ad3c38cf88ba44b9ea5"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
