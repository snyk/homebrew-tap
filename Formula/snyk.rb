class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1042.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1042.0/snyk-macos"
    sha256 "4b9882d5c1bf6329830201c44017ab3ab1d251346ac0b7dc90415eb0dc6a7132"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1042.0/snyk-linux"
    sha256 "771c088166bc52ad1b66312e1058a8d438f76dc02d5c6a37ae10ca8c26d161b6"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
