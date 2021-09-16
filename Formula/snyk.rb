class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.715.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.715.0/snyk-macos"
    sha256 "9ee666a81df476fbae8d34fa88de75a1e7bdf9490b15ee8e8d303a029d404ba5"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.715.0/snyk-linux"
    sha256 "7e5ab3c1bc2b547634fb45af92a7bff96d837ee56329fd2759133a6865f4b9c6"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
