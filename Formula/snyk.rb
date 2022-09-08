class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.999.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.999.0/snyk-macos"
    sha256 "e51a0268e55e728184ab727d25e5c964e2b4b4e81748ef970f2a2e81f0a8fb0b"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.999.0/snyk-linux"
    sha256 "7afd935a457d32e1e3a6c832b5d87d950d8df874334411b90b9ac8db6f40362c"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
