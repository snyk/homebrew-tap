class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1216.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1216.0/snyk-macos"
    sha256 "33fd9bedd528beffeace8d57010cdeb4509802ff9c54fdae0372ca8ea553c94d"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1216.0/snyk-linux"
    sha256 "0c446c95f5c05f39f53fc45a92c7f072bfa17ccb5d20841218c381dccb57b4e5"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
